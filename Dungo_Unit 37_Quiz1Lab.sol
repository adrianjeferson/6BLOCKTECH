// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ServiceFee {

    function run(
        string memory firstName,
        string memory middleName,
        string memory lastName,
        uint8 serviceCode
    ) public pure returns (uint256, bytes32, string memory) {

        uint256 fee;

        if (serviceCode == 1) {
            fee = 11200;
        }

        if (serviceCode == 2) {
            fee = 2464;
        }

        uint256 d = fee;
        while (d >= 10) {
            d /= 10;
        }

        bytes1 a = bytes(firstName)[0];
        bytes1 b = bytes(middleName)[bytes(middleName).length - 1];
        bytes1 c = bytes(lastName)[0];

        bytes32 h;

        if (serviceCode == 1) {
            h = keccak256(
                abi.encodePacked(a, b, c, serviceCode, d)
            );
        }

        if (serviceCode == 2) {
            h = keccak256(
                abi.encode(a, b, c, serviceCode, d)
            );
        }

        return (
            fee,
            h,
            string(
                abi.encodePacked(
                    a,
                    b,
                    c,
                    uint8(serviceCode + 48),
                    uint8(d + 48)
                )
            )
        );
    }
}
