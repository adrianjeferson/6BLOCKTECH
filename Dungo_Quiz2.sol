// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringHashingNewbie {
    string public fullName;

    string public barangayExtract;
    string public cityExtract;
    string public provinceExtract;
    string public countryExtract;

    string public concatenatedResult;

    bytes32 public hashAbiEncode;
    bytes32 public hashAbiEncodePacked;

    constructor(string memory _fullName) {
        fullName = _fullName;
    }

    function processStrings(
        string memory barangay,
        string memory city,
        string memory province,
        string memory country
    ) public {
        bytes memory bBarangay = bytes(barangay);
        bytes memory bCity = bytes(city);
        bytes memory bProvince = bytes(province);
        bytes memory bCountry = bytes(country);

        barangayExtract = string(abi.encodePacked(bBarangay[0], bBarangay[1]));
        cityExtract = string(abi.encodePacked(bCity[0], bCity[1]));
        provinceExtract = string(
            abi.encodePacked(
                bProvince[bProvince.length - 2],
                bProvince[bProvince.length - 1]
            )
        );
        countryExtract = string(
            abi.encodePacked(
                bCountry[bCountry.length - 2],
                bCountry[bCountry.length - 1]
            )
        );

        concatenatedResult = string(
            abi.encodePacked(
                barangayExtract,
                cityExtract,
                provinceExtract,
                countryExtract
            )
        );

        hashAbiEncode = keccak256(
            abi.encode(
                barangayExtract,
                cityExtract,
                provinceExtract,
                countryExtract
            )
        );

        hashAbiEncodePacked = keccak256(
            abi.encodePacked(
                barangayExtract,
                cityExtract,
                provinceExtract,
                countryExtract
            )
        );
    }
}
