// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IPatient {
    function initialize(address _owner) external returns (bool);
    function addRecord(
        uint256 _date,
        string memory _department,
        string memory _topic,
        string memory _description,
        string memory _doctor
    ) external returns (bool);
    function getRecords() external view returns (uint _recordCount);
    function getExactRecord(uint _index) external view returns (uint256 _date, string memory _department, string memory _topic);
}