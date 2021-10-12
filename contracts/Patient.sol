// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Patient {

    address hospital;
    address owner = address(0);

    bool expose;
    mapping(address => bool) allowance;

    struct Record {
        uint256 date;
        string department;
        string topic;
    }

    Record[] records;
    uint reccordCount = 0;
    
    constructor () {
        hospital = msg.sender;
    }

    function initialize(address _owner) public {
        require(owner == address(0), "MEDPROJECTS: Already owned by someone");
        owner = _owner;
    }
}