// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IHospital {
    function createPatient(address _patient) external returns(address patient); 
    function selfCreatePatient(address _patient) external  returns (address patient);

    function addRecord(
        address target,
        uint256 _date,
        string memory _department,
        string memory _topic,
        string memory _description,
        string memory _doctor
    ) external returns (bool);

    function getPatient(address _patient) external view returns (address patientContract);
}