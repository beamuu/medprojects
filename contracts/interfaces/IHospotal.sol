// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IHospital {
    function createPatient(address _patient) external returns(address patient); 
}