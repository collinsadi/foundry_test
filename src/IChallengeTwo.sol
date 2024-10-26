// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

interface IChallengeTwo {
    function passKey(uint16 _key) external;
    function getENoughPoint(string memory _name) external;
    function addYourName() external;
    function getAllwiners() external view returns (string[] memory _names);

    function userPoint(address user) external view returns (uint);
    function Names(address user) external view returns (string memory);
    function hasSolved1(address user) external view returns (bool);
}
