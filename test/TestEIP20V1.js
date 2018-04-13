import _ from 'lodash'
import { expect } from 'chai'
import { web3 } from './helpers/w3'
import {expectRevert} from './helpers/expectRevert'


const accounts = web3.accounts;

const ContractV1 = artifacts.require('./V1/ContractV1.sol')
const ContractV2 = artifacts.require('./V2/ContractV2.sol');

const UniversalStorage = artifacts.require('./Utils/universal_storage/UniversalStorage.sol')
const ContractStorage = artifacts.require('./ContractStorage.sol')
const Contract = artifacts.require('./Contract.sol'); 

const terry = '0x09f45d16127162574874a26fe3c2c126729f1a2b';
const toniya = '0x1f3b386e476b32ad593c8cb61efaba7b8aef48af';
const lina = '0x3a0f57a7c4caac6926565ddeb07b7c26ac1509e9';


describe('testing EIP20 token functionality',async ()=>{
    it('Testing ContractV1',async()=> {
        //Intializing variables
        var input1 = 100;
        var input2 = 500;
        var allowance = 50;

        //Deploying the universalStorage contract
        const universalStorage =  await UniversalStorage.new()
    
        //Deploying the ContractStorage contract
        const contractStorage =  await ContractStorage.new()
    

       //Deploying the main contract 
       let maincontract =  await Contract.new(universalStorage.address,contractStorage.address,90000)
        
        //Deploying V1 contract
        const contractV1 =  await ContractV1.new()
        
       
        //Checking whether we have upgraded the correct version
         await maincontract.upgradeTo(ContractV1.address)
         expect(await maincontract.getImplementation.call()).to.equal(ContractV1.address);

        //extending the truffle object to include ContractV1 functions which will be now excecuted by proxy
        maincontract = _.extend(maincontract,ContractV1.at(maincontract.address))
        
        //Testing whether the initial amount is equal to the assigned amount
        var totalSupply = await maincontract.totalSupplyOf.call() 
        expect(totalSupply.toNumber()).to.equal(90000);
        
        //Calling Transfer function 
        await maincontract.claimInitialSupply()
        
        // calling the transfer function to transfer some money
        await maincontract.transfer(toniya,input1)
        
         //Deploying V2 contract
        const contractV2 =  await ContractV2.new()
        
       
        //Checking whether we have upgraded the correct version
        await maincontract.upgradeTo(ContractV2.address)
        expect(await maincontract.getImplementation.call()).to.equal(ContractV2.address);

        //extending the truffle object to include ContractV1 functions which will be now excecuted by proxy
        maincontract = _.extend(maincontract,ContractV2.at(maincontract.address))

        //Testing the totalSupply after upgrading contractV2
        // var total = await maincontract.totalSupplyOf.call() 
        expect(totalSupply.toNumber()).to.equal(90000);


        //Testing whether the balance has been deducted from account1 and added to account2
        var balance = await maincontract.balanceOf.call(terry) 
        var remaining = totalSupply.toNumber()-input1 ;
        expect(balance.toNumber()).to.equal(remaining);

            
         //Testing transfer function from ContractV2  
          await maincontract.transfer(lina,input2)
          var balance = await maincontract.balanceOf.call(lina) 
          expect(balance.toNumber()).to.equal(input2);
        
          //Testing trnsferFrom function
          await maincontract.approve(lina,allowance)  

        // Testing getAllowance function
        var allowan = await maincontract.getAllowance.call(terry,lina)
        expect(allowan.toNumber()).to.equal(allowance);

        //Testing TrasnferFrom function
        await maincontract.transferFrom(terry,toniya,50,{from: lina});
        var balance = await maincontract.balanceOf.call(toniya) 
        
        
        //Testing the Increase supply function 
        await maincontract.increaseSupply(1000)
        //var totalSupply = await maincontract.totalSupplyOf.call() 
        //console.log(totalSupply.toNumber())
        
    })
})