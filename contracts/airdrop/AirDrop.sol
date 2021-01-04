pragma solidity ^0.7.4;

import "./IAirDrop.sol";
import "../token/ERC223.sol";

/**
 * @title Reference implementation of the AirDrop contract.
 */
contract AirDrop is IAirDrop {
    mapping(address => uint256) private amounts; // List of airdrop amounts per address
    ERC223Token private token;

    /**
     * @dev Whitelists the given address to claim 'value' tokens for airdrop,
     * only the owner is authorized to do this action
     *
     * @param _addr    Receiver address.
     * @param _amount   Amount of tokens that will be transferred.
     */
    function whitelist(address _addr, uint256 _amount)
        public
        override
        returns (bool success)
    {
        amounts[_addr] = _amount;
        return true;
    }

    /**
     * @dev Whitelisted users can claim the amount of tokens that the owner defined
     */
    function claim() public override returns (bool success) {
        token.transfer(msg.sender, amounts[msg.sender]);
        amounts[msg.sender] = 0;
        return true;
    }

    /**
     * @dev Get the claimable amount for the given address
     */
    function amountClaimable() public view override returns (uint256 amount) {
        return amounts[msg.sender];
    }
}
