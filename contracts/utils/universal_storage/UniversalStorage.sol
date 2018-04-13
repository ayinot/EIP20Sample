pragma solidity ^0.4.18;

contract UniversalStorage {

    //int sized storage
    // mapping(address => mapping(bytes32 => int8)) int8Storage;
    // mapping(address => mapping(bytes32 => int16)) int16Storage;
    // mapping(address => mapping(bytes32 => int24)) int24Storage;
    // mapping(address => mapping(bytes32 => int32)) int32Storage;
    // mapping(address => mapping(bytes32 => int64)) int64Storage;
    // mapping(address => mapping(bytes32 => int96)) int96Storage;
    // mapping(address => mapping(bytes32 => int128)) int128Storage;
    // mapping(address => mapping(bytes32 => int160)) int160Storage;
    // mapping(address => mapping(bytes32 => int192)) int192Storage;
    // mapping(address => mapping(bytes32 => int224)) int224Storage;
    mapping(address => mapping(bytes32 => int256)) int256Storage;

    //uint sized storage
    // mapping(address => mapping(bytes32 => uint8)) uint8Storage;
    // mapping(address => mapping(bytes32 => uint16)) uint16Storage;
    // mapping(address => mapping(bytes32 => uint24)) uint24Storage;
    // mapping(address => mapping(bytes32 => uint32)) uint32Storage;
    // mapping(address => mapping(bytes32 => uint64)) uint64Storage;
    // mapping(address => mapping(bytes32 => uint96)) uint96Storage;
    // mapping(address => mapping(bytes32 => uint128)) uint128Storage;
    // mapping(address => mapping(bytes32 => uint160)) uint160Storage;
    // mapping(address => mapping(bytes32 => uint192)) uint192Storage;
    // mapping(address => mapping(bytes32 => uint224)) uint224Storage;
    mapping(address => mapping(bytes32 => uint256)) uint256Storage;

    // fixed size byte arrays storage
    // mapping(address => mapping(bytes32 => byte)) byteStorage;
    // mapping(address => mapping(bytes32 => bytes2)) bytes2Storage;
    // mapping(address => mapping(bytes32 => bytes3)) bytes3Storage;
    // mapping(address => mapping(bytes32 => bytes4)) bytes4Storage;
    // mapping(address => mapping(bytes32 => bytes8)) bytes8Storage;
    // mapping(address => mapping(bytes32 => bytes12)) bytes12Storage;
    // mapping(address => mapping(bytes32 => bytes16)) bytes16Storage;
    // mapping(address => mapping(bytes32 => bytes20)) bytes20Storage;
    // mapping(address => mapping(bytes32 => bytes24)) bytes24Storage;
    // mapping(address => mapping(bytes32 => bytes28)) bytes28Storage;
    mapping(address => mapping(bytes32 => bytes32)) bytes32Storage;

    // address storage
    mapping(address => mapping(bytes32 => address)) addressStorage;

    //bool storage
    mapping(address => mapping(bytes32 => bool)) boolStorage;

    // string storage
    mapping(address => mapping(bytes32 => string)) stringStorage;

    // dynamic bytes storage
    mapping(address => mapping(bytes32 => bytes)) bytesStorage;

    /**** Getter Methods ***********/

    // all int getters
    // function getInt8(bytes32 _key) public view returns (int8) {
    //     return int8Storage[msg.sender][_key];
    // }
    // function getInt16(bytes32 _key) public view returns (int16) {
    //     return int16Storage[msg.sender][_key];
    // }
    // function getInt24(bytes32 _key) public view returns (int24) {
    //     return int24Storage[msg.sender][_key];
    // }
    // function getInt32(bytes32 _key) public view returns (int32) {
    //     return int32Storage[msg.sender][_key];
    // }
    // function getInt64(bytes32 _key) public view returns (int64) {
    //     return int64Storage[msg.sender][_key];
    // }
    // function getInt96(bytes32 _key) public view returns (int96) {
    //     return int96Storage[msg.sender][_key];
    // }
    // function getInt128(bytes32 _key) public view returns (int128) {
    //     return int128Storage[msg.sender][_key];
    // }
    // function getInt160(bytes32 _key) public view returns (int160) {
    //     return int160Storage[msg.sender][_key];
    // }
    // function getInt192(bytes32 _key) public view returns (int192) {
    //     return int192Storage[msg.sender][_key];
    // }
    // function getInt224(bytes32 _key) public view returns (int224) {
    //     return int224Storage[msg.sender][_key];
    // }
    function getInt256(bytes32 _key) public view returns (int256) {
        return int256Storage[msg.sender][_key];
    }

    // all uint getters
    // function getUint8(bytes32 _key) public view returns (uint8) {
    //     return uint8Storage[msg.sender][_key];
    // }
    // function getUint16(bytes32 _key) public view returns (uint16) {
    //     return uint16Storage[msg.sender][_key];
    // }
    // function getUint24(bytes32 _key) public view returns (uint24) {
    //     return uint24Storage[msg.sender][_key];
    // }
    // function getUint32(bytes32 _key) public view returns (uint32) {
    //     return uint32Storage[msg.sender][_key];
    // }
    // function getUint64(bytes32 _key) public view returns (uint64) {
    //     return uint64Storage[msg.sender][_key];
    // }
    // function getUint96(bytes32 _key) public view returns (uint96) {
    //     return uint96Storage[msg.sender][_key];
    // }
    // function getUint128(bytes32 _key) public view returns (uint128) {
    //     return uint128Storage[msg.sender][_key];
    // }
    // function getUint160(bytes32 _key) public view returns (uint160) {
    //     return uint160Storage[msg.sender][_key];
    // }
    // function getUint192(bytes32 _key) public view returns (uint192) {
    //     return uint192Storage[msg.sender][_key];
    // }
    // function getUint224(bytes32 _key) public view returns (uint224) {
    //     return uint224Storage[msg.sender][_key];
    // }
    function getUint256(bytes32 _key) public view returns (uint256) {
        return uint256Storage[msg.sender][_key];
    }

    // fixed byte array getters
    // function getByte(bytes32 _key) public view returns (byte) {
    //     return byteStorage[msg.sender][_key];
    // }
    // function getBytes2(bytes32 _key) public view returns (bytes2) {
    //     return bytes2Storage[msg.sender][_key];
    // }
    // function getBytes3(bytes32 _key) public view returns (bytes3) {
    //     return bytes3Storage[msg.sender][_key];
    // }
    // function getBytes4(bytes32 _key) public view returns (bytes4) {
    //     return bytes4Storage[msg.sender][_key];
    // }
    // function getBytes8(bytes32 _key) public view returns (bytes8) {
    //     return bytes8Storage[msg.sender][_key];
    // }
    // function getBytes12(bytes32 _key) public view returns (bytes12) {
    //     return bytes12Storage[msg.sender][_key];
    // }
    // function getBytes16(bytes32 _key) public view returns (bytes16) {
    //     return bytes16Storage[msg.sender][_key];
    // }
    // function getBytes20(bytes32 _key) public view returns (bytes20) {
    //     return bytes20Storage[msg.sender][_key];
    // }
    // function getBytes24(bytes32 _key) public view returns (bytes24) {
    //     return bytes24Storage[msg.sender][_key];
    // }
    // function getBytes28(bytes32 _key) public view returns (bytes28) {
    //     return bytes28Storage[msg.sender][_key];
    // }
    function getBytes32(bytes32 _key) public view returns (bytes32) {
        return bytes32Storage[msg.sender][_key];
    }

    // address getter
    function getAddress(bytes32 _key) public view returns (address) {
        return addressStorage[msg.sender][_key];
    }
    // bool getter
    function getBool(bytes32 _key) public view returns (bool) {
        return boolStorage[msg.sender][_key];
    }
    // string getter
    function getString(bytes32 _key) public view returns (string) {
        return stringStorage[msg.sender][_key];
    }
    // dynamic byte array getter
    function getBytes(bytes32 _key) public view returns (bytes) {
        return bytesStorage[msg.sender][_key];
    }

  /**** Setter Methods ***********/
  // all int size setters
    // function setInt8(bytes32 _key, int8 _value) public {
    //      int8Storage[msg.sender][_key] = _value;
    // }
    // function setInt16(bytes32 _key, int16 _value) public {
    //      int16Storage[msg.sender][_key] = _value;
    // }
    // function setInt24(bytes32 _key, int24 _value) public {
    //      int24Storage[msg.sender][_key] = _value;
    // }
    // function setInt32(bytes32 _key, int32 _value) public {
    //      int32Storage[msg.sender][_key] = _value;
    // }
    // function setInt64(bytes32 _key, int64 _value) public {
    //      int64Storage[msg.sender][_key] = _value;
    // }
    // function setInt96(bytes32 _key, int96 _value) public {
    //      int96Storage[msg.sender][_key] = _value;
    // }
    // function setInt128(bytes32 _key, int128 _value) public {
    //      int128Storage[msg.sender][_key] = _value;
    // }
    // function setInt160(bytes32 _key, int160 _value) public {
    //      int160Storage[msg.sender][_key] = _value;
    // }
    // function setInt192(bytes32 _key, int192 _value) public {
    //      int192Storage[msg.sender][_key] = _value;
    // }
    // function setInt224(bytes32 _key, int224 _value) public {
    //      int224Storage[msg.sender][_key] = _value;
    // }
    function setInt256(bytes32 _key, int256 _value) public {
        int256Storage[msg.sender][_key] = _value;
    }

    //uint size setters
    // function setUint8(bytes32 _key, uint8 _value) public {
    //      uint8Storage[msg.sender][_key] = _value;
    // }
    // function setUint16(bytes32 _key, uint16 _value) public {
    //      uint16Storage[msg.sender][_key] = _value;
    // }
    // function setUint24(bytes32 _key, uint24 _value) public {
    //      uint24Storage[msg.sender][_key] = _value;
    // }
    // function setUint32(bytes32 _key, uint32 _value) public {
    //      uint32Storage[msg.sender][_key] = _value;
    // }
    // function setUint64(bytes32 _key, uint64 _value) public {
    //      uint64Storage[msg.sender][_key] = _value;
    // }
    // function setUint96(bytes32 _key, uint96 _value) public {
    //      uint96Storage[msg.sender][_key] = _value;
    // }
    // function setUint128(bytes32 _key, uint128 _value) public {
    //      uint128Storage[msg.sender][_key] = _value;
    // }
    // function setUint160(bytes32 _key, uint160 _value) public {
    //      uint160Storage[msg.sender][_key] = _value;
    // }
    // function setUint192(bytes32 _key, uint192 _value) public {
    //      uint192Storage[msg.sender][_key] = _value;
    // }
    // function setUint224(bytes32 _key, uint224 _value) public {
    //      uint224Storage[msg.sender][_key] = _value;
    // }
    function setUint256(bytes32 _key, uint256 _value) public {
        uint256Storage[msg.sender][_key] = _value;
    }

    // fixed sized byte array setters
    // function setByte(bytes32 _key, byte _value) public {
    //     byteStorage[msg.sender][_key] = _value;
    // }
    // function setBytes2(bytes32 _key, bytes2 _value) public {
    //     bytes2Storage[msg.sender][_key] = _value;
    // }
    // function setBytes3(bytes32 _key, bytes3 _value) public {
    //     bytes3Storage[msg.sender][_key] = _value;
    // }
    // function setBytes4(bytes32 _key, bytes4 _value) public {
    //     bytes4Storage[msg.sender][_key] = _value;
    // }
    // function setBytes8(bytes32 _key, bytes8 _value) public {
    //     bytes8Storage[msg.sender][_key] = _value;
    // }
    // function setBytes16(bytes32 _key, bytes16 _value) public {
    //     bytes16Storage[msg.sender][_key] = _value;
    // }
    // function setBytes20(bytes32 _key, bytes20 _value) public {
    //     bytes20Storage[msg.sender][_key] = _value;
    // }
    // function setBytes24(bytes32 _key, bytes24 _value) public {
    //     bytes24Storage[msg.sender][_key] = _value;
    // }
    // function sets28Byte(bytes32 _key, bytes28 _value) public {
    //     bytes28Storage[msg.sender][_key] = _value;
    // }
    function setBytes32(bytes32 _key, bytes32 _value) public {
        bytes32Storage[msg.sender][_key] = _value;
    }
    // address setter
    function setAddress(bytes32 _key, address _value) public {
        addressStorage[msg.sender][_key] = _value;
    }
    // bool setter
    function setBool(bytes32 _key, bool _value) public {
        boolStorage[msg.sender][_key] = _value;
    }
    // string setter
    function setString(bytes32 _key, string _value) public {
        stringStorage[msg.sender][_key] = _value;
    }
    // dynamic bytes array setter
    function setBytes(bytes32 _key, bytes _value) public {
        bytesStorage[msg.sender][_key] = _value;
    }
}

/*
Where to interface and implement these useful data structures? Note: they are not completed

// Lookup table
contract LUT {
    mapping (address => uint) public balances;
    address[] public addressLUT;

    // Requires a public getter for array size
    function size() public returns (uint) {
        return addressLUT.length;
    }

    function add(address _addr, uint _amount) {
        balances[_addr] = _amount;
        addressLUT.push(_addr);
    }

    // Warning: unbounded gas loop
    function gapLessRemove(address _addr, uint _index) {
        delete balances[_addr];

        if (_index < addressLUT.length) {
            for (uint i = _index; i<addressLUT.length-1; i++) {
                addressLUT[i] = addressLUT[i+1];
            }
            addressLUT.length--;
        }
    }

    function remove(address _addr, uint _index) {
        delete balances[_addr];
    }
}


// Single Linked List
contract SLL {
    mapping (address => address) llIndex;
    mapping (address => uint) public balances;

    function add(address _addr) public {
        llIndex[_addr] = llIndex[0x0];
        llIndex[0x0] = _addr;
    }

    function remove(address _addr) {
        address parent;

        // Warning: can cost a lot of gas for large lists
        while (llIndex[parent] != _addr) {
            parent = llIndex[parent];
        }

        llIndex[parent] = llIndex[ llIndex[parent]];
        delete llIndex[_addr];
        delete balances[_addr];
    }
}

// Double linked list
contract DLL {
    mapping(address => mapping (bool => address)) dllIndex;
    mapping(address => uint) balances;
    bool PREV = false;
    bool NEXT = true;
    function add(address _addr) {
        // Link the new node 
        dllIndex[_addr][PREV] = 0x0;
        dllIndex[_addr][NEXT] = dllIndex[0x0][NEXT];

        // Insert the new node
        dllIndex[dllIndex[0x0][NEXT]][PREV] = _addr;
        dllIndex[0x0][NEXT] = _addr;
    }

    function remove(address _addr) {
        // Stitch the neighbours together
        dllIndex[ dllIndex[_addr][PREV] ][NEXT] = dllIndex[_addr][NEXT];
        dllIndex[ dllIndex[_addr][NEXT] ][PREV] = dllIndex[_addr][PREV];

        // Delete state storage
        delete dllIndex[_addr][PREV];
        delete dllIndex[_addr][NEXT];
        delete balances[_addr];
    }
}
*/