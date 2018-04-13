require('babel-register')
require('babel-polyfill')

module.exports = {
  networks: {
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*', // Match any network id
      from: '0x09f45d16127162574874a26fe3c2c126729f1a2b'      
    }
}
}