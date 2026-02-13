// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {StudentAttendance} from "../src/StudentAttendance.sol";

contract StudentAttendanceScript is Script {
    StudentAttendance public studentAttendance;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        studentAttendance = new StudentAttendance();

        vm.stopBroadcast();
    }
}