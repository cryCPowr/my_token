// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {TokenOwnable} from "../src/Token/Token.sol";

contract TokenOWNABLETest is Test {
    TokenOwnable public tokenownable;
    address public deployer;

    function setUp() public {
        deployer = vm.addr(1); // Alamat simulasi sebagai deployer
        vm.startPrank(deployer); // Mensimulasikan transaksi dari alamat deployer
        tokenownable = new TokenOwnable();
        vm.stopPrank();
    }

    function testTOTAL_SUPPLY() public {
        uint256 ts = tokenownable.totalSupply();
        assertEq(ts, 116_160_000_000 * 10 ** 18);
    }

    function testBalanceOf() public {
        // Pengujian balance pemilik (deployer)
        uint256 boDeployer = tokenownable.balanceOf(deployer);
        assertEq(boDeployer, 116_160_000_000 * 10 ** 18);

        // Pengujian balance alamat lain
        address caUser1 = address(0x123);
        uint256 boUser1 = tokenownable.balanceOf(caUser1);
        assertEq(boUser1, 0);
    }
}
