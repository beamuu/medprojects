// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Patient {

    address public hospital;
    address public owner;

    bool expose;
    mapping(address => bool) allowance;

    struct Record {
        uint256 date;
        string department;
        string topic;
        string description;
        string doctor;
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
        string memory _topic,
        string memory _description,
        string memory _doctor
    ) public returns (bool) {
        require(msg.sender == hospital, "Medprojects: ADD_RECORD not allowed");
        Record memory newRecord;
        newRecord.date = _date;
        newRecord.department = _department;
        newRecord.topic = _topic;
        newRecord.description = _description;
        newRecord.doctor = _doctor;
        records.push(newRecord);
        recordCount += 1;
        return true;
    }
    function getRecords() public view returns (uint _recordCount) {
        // Get amount of patient's records 
        _recordCount = recordCount;
    }
    function getExactRecord(uint _index) public view returns (
        uint256 _date, 
        string memory _department, 
        string memory _topic,
        string memory _description,
        string memory _doctor
    ) {
        // Get exact record by index
        Record memory target = records[_index];
        _date = target.date;
        _department = target.department;
        _topic = target.topic;
        _description = target.description;
        _doctor = target.doctor;
    }
}