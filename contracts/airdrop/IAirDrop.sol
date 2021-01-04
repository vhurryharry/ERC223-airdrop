pragma solidity ^0.7.4;

/**
 * @title Interface of the AirDrop contract
 */

interface IAirDrop {
    /**
     * @dev Whitelists the given address to claim 'value' tokens for airdrop,
     * only the owner is authorized to do this action
     */
    function whitelist(address addr, uint256 amount)
        external
        returns (bool success);

    /**
     * @dev Whitelisted users can claim the amount of tokens that the owner defined
     */
    function claim() external returns (bool success);

    /**
     * @dev Get the claimable amount
     */
    function amountClaimable() external returns (uint256 amount);
}
