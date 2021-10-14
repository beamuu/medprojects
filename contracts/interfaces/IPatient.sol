// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IPatient {
    function initialize(address _owner) external returns (bool);
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
    ) external returns (bool);
    function getRecords() external view returns (uint _recordCount);
    function getExactRecord(uint _index) external view returns (
        uint112 _dateStart,
        uint112 _dateEnd,
        string memory _department,
        string[] memory _treatmentTopics,
        string[] memory _treatmentDescription,
        string[] memory _resultTopics,
        string[] memory _resultDescription,
        string[] memory _doctor,
        string[] memory _doctorResponsibility
    );
}