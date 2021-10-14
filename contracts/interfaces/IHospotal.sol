// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IHospital {
    function createPatient(address _patient) external returns(address patient); 
    function selfCreatePatient(address _patient) external  returns (address patient);

    function addRecord(
        address target,
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

    function getPatient(address _patient) external view returns (address patientContract);
}