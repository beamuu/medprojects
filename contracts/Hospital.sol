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

    modifier onlyOwner {
        require(msg.sender == owner, "Medprojects: PERMISSION_DENIED");
        _;
   }

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

    function createPatient() external returns (address patient) {

        /*  Right now, I decide that any one can createPatient by their own.
            This will help any hospital to pay less gas for creating multiple
            patients. Hospital needs to create new patients by using selfCreatePatient().
        */

        // require(msg.sender == owner, "Medprojects: CREATE_FAILED");
        address _patient = msg.sender;
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

    function selfCreatePatient(address _patient) public onlyOwner returns (address patient) {

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

    function addRecord(
        address target,
        uint256 _date,
        string memory _department,
        string memory _topic,
        string memory _description,
        string memory _doctor
    ) public onlyOwner returns (bool) {
        address destinationContract = patients[target];
        IPatient(destinationContract).addRecord(_date, _department, _topic, _description, _doctor);
        return true;
    }

    function getPatient(address _patient) public view returns (address patientContract) {
        patientContract = patients[_patient];
    }

    
}