// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IPatient.sol";
import "./Patient.sol";

contract Hospital { 

    string public hospitalName;
    string public hospitalId;
    string public hospitalLicense;
    string public hospitalLocation;

    address public owner;

    mapping(address => address) patients;

    constructor(
        string memory _hospitalName,
        string memory _hospitalId,
        string memory _hospitalLicense,
        string memory _hospitalLocation
    ) {
        owner = msg.sender;
        hospitalName = _hospitalName;
        hospitalId = _hospitalId;
        hospitalLicense = _hospitalLicense;
        hospitalLocation = _hospitalLocation;
    }

    function createPatient(address _patient) external returns (address patient) {
        require(msg.sender == owner, "Medprojects: CREATE_FAILED");
        require(msg.sender != address(0), "Medprojects: RECIEVE_ADDRESS_0");
        require(patients[_patient] == address(0), "Medprojects: ADDRESS_EXISTED");
        bytes memory bytecode = type(Patient).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(_patient,block.timestamp));
        assembly {
            patient := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        IPatient(patient).initialize(_patient);
        patients[_patient] = patient;
    }

    function getPatient(address _patient) public view returns (address patientContract) {
        patientContract = patients[_patient];
    }

    
}