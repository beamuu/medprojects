// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Patient {

    address public hospital;
    address public owner;

    struct Record {
        uint112 dateStart;
        uint112 dateEnd;
        string department;
        string[] treatmentTopics;
        string[] treatmentDescription;
        string[] resultTopics;
        string[] resultDescription;
        string[] doctor;
        string[] doctorResponsibility;
    }

    // allowance
    mapping(address => mapping(uint => bool)) allowances;

    // records
    Record[] records;
    uint recordCount = 0;
    
    modifier onlyOwner {
        require(msg.sender == owner, "Medprojects: PERMISSION_DENIED");
        _;
    }
    modifier onlyHospital {
        require(msg.sender == hospital, "Medprojects: PERMISSION_DENIED");
        _;
    }

    constructor () {
        hospital = msg.sender;
    }

    function initialize(address _owner) external onlyHospital returns (bool) {
        owner = _owner;
        return true;
    }

    function addRecord(
        uint112 _dateStart,
        uint112 _dateEnd,
        string memory _department,
        string[] memory _treatmentTopics,
        string[] memory _treatmentDescription,
        string[] memory _resultTopics,
        string[] memory _resultDescription,
        string[] memory _doctor,
        string[] memory _doctorResponsibility
    ) public returns (bool) {
        // only hospital can add records
        require(msg.sender == hospital, "Medprojects: ADD_RECORD not allowed");
        Record memory newRecord;
        newRecord.dateStart = _dateStart;
        newRecord.dateEnd = _dateEnd;
        newRecord.department = _department;
        newRecord.treatmentTopics = _treatmentTopics;
        newRecord.treatmentDescription = _treatmentDescription;
        newRecord.resultTopics = _resultTopics;
        newRecord.resultDescription = _resultDescription;
        newRecord.doctor = _doctor;
        newRecord.doctorResponsibility = _doctorResponsibility;
        records.push(newRecord);
        recordCount += 1;
        return true;
    }
    function getRecords() public view returns (uint _recordCount) {
        // Get amount of patient's records 
        _recordCount = recordCount;
    }
    function getExactRecord(uint _index) public view returns (
        uint112 _dateStart,
        uint112 _dateEnd,
        string memory _department,
        string[] memory _treatmentTopics,
        string[] memory _treatmentDescription,
        string[] memory _resultTopics,
        string[] memory _resultDescription,
        string[] memory _doctor,
        string[] memory _doctorResponsibility
    ) {
        // Get exact record by index
        Record memory target = records[_index];
        _dateStart = target.dateStart;
        _dateEnd = target.dateEnd;
        _department = target.department;
        _treatmentTopics = target.treatmentTopics;
        _treatmentDescription = target.treatmentDescription;
        _resultTopics = target.resultTopics;
        _resultDescription = target.resultDescription;
        _doctor = target.doctor;
        _doctorResponsibility = target.doctorResponsibility;
    }
    function approve(address target, uint recordIndex) public onlyOwner returns (bool) {
        allowances[target][recordIndex] = true;
        return true;
    }
    function unapprove(address target, uint recordIndex) public onlyOwner returns (bool) {
        allowances[target][recordIndex] = false;
        return true;
    }
    function allowance(address target, uint recordIndex) public view returns (bool result) {
        result = allowances[target][recordIndex];
    }
}