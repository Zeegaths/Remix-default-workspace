// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./School.sol";


contract SchoolFactory {
    School [] public schoolArr;
    School public schoolSystem;
    


    //array/count


    function createSchool() public {
        schoolSystem = new School(); 
        schoolArr.push(schoolSystem);       
    }
    function allShools() public view returns (School[] memory) {
    return schoolArr;
    }       
}