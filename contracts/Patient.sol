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
    uint recordCount = 0;
    
    constructor () {
        hospital = msg.sender;
    }

    function initialize(address _owner) external returns (bool){
        require(owner == address(0), "Medprojects: INIT_FAIL");
        owner = _owner;
        return true;
    }

    function addRecord(
        uint256 _date,
        string memory _department,
        string memory _topic
    ) public returns (bool) {
        require(msg.sender == hospital || msg.sender == owner, "Medprojects: ADD_RECORD not allowed");
        Record memory newRecord;
        newRecord.date = _date;
        newRecord.department = _department;
        newRecord.topic = _topic;
        records.push(newRecord);
        recordCount += 1;
        return true;
    }
    function getRecords() public view returns (uint _recordCount) {
        _recordCount = recordCount;
    }
    function getExactRecord(uint _index) public view returns (uint256 _date, string memory _department, string memory _topic) {
        Record memory target = records[_index];
        _date = target.date;
        _department = target.department;
        _topic = target.topic;
    }
}