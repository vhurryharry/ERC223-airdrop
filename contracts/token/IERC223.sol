pragma solidity ^0.7.4;

/**
 * @dev Interface of the ERC777Token standard as defined in the EIP.
 *
 * This contract uses the
 * [ERC1820 registry standard](https://eips.ethereum.org/EIPS/eip-1820) to let
 * token holders and recipients react to token movements by using setting implementers
 * for the associated interfaces in said registry. See `IERC1820Registry` and
 * `ERC1820Implementer`.
 */

interface IERC223 {
    /**
     * @dev Returns the balance of the `who` address.
     */
    function balanceOf(address who) external view returns (uint256);

    /**
     * @dev Transfers `value` tokens from `msg.sender` to `to` address
     * and returns `true` on success.
     */
    function transfer(address to, uint256 value)
        external
        returns (bool success);

    /**
     * @dev Transfers `value` tokens from `msg.sender` to `to` address with `data` parameter
     * and returns `true` on success.
     */
    function transfer(
        address to,
        uint256 value,
        bytes memory data
    ) external returns (bool success);

    /**
     * @dev Event that is fired on successful transfer.
     */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value,
        bytes data
    );
}
