pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract OceanToken is ERC20, ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;
    uint256 public reward;

    constructor(uint256 cap, uint256 reward) ERC20("OceanToken", "OCT") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 700000000 * (10 ** decimals()));
        blockReward = reward * (10** decimals());
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Capped, ERC20Burnable) {
        ERC20Capped._beforeTokenTransfer(from, to, value);
        ERC20Burnable._beforeTokenTransfer(from, to, value);

        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)) && ERC20.totalSupply() + blockReward <= cap()) {
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}




