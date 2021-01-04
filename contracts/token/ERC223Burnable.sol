pragma solidity ^0.7.4;

import "./ERC223.sol";
import "../math/SafeMath.sol";

/**
 * @dev Extension of {ERC223} that allows token holders to destroy both their own
 * tokens and those that they have an allowance for, in a way that can be
 * recognized off-chain (via event analysis).
 */
contract ERC223Burnable is ERC223Token {
    using SafeMath for uint256;

    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 _amount) public {
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        _totalSupply = _totalSupply.sub(_amount);

        bytes memory empty = hex"00000000";
        emit Transfer(msg.sender, address(0), _amount, empty);
    }
}
