// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


// error X_NOT_FOUND();
// library arraylib {
//     function find(uint[] storage publicArray, uint x) public view returns(uint) {
//         for ( uint i = 0; i < publicArray.length; i++) {
//             if (publicArray[i] == x) {
//                 return i;
//             }
//         }
//         revert ();
//     }

// }

// contract Array {
//     using arraylib for uint[];

//     uint[] publicArray = [2, 2, 9];
//     function findIndex () external view returns(uint i) {
//         return publicArray.find(4);
//     }

// }

library myLib {
    struct Player {
        uint score;
    }

    function increaseScore(Player storage _player, uint _score) internal returns (uint) {
        return _player.score += _score;
    }
}
contract Lib2 {
    using myLib for myLib.Player;

    mapping(uint => myLib.Player) players ;

    function updatescore() external returns (uint) {
        return players[0].increaseScore(2);
        }
        
}
