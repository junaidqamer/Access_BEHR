pragma solidity ^0.5.0;
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract AccessToken{
    using SafeMath for uint;
    address payable provider=msg.sender;
    string public symbol="ACS";
    // exchange rate 1 ETH=100 ACS
    uint public exchange_rate=100;
    
    mapping(address=> uint) balances;
    
    function balance()public view returns (uint){
        return balances[msg.sender];
    }
    
    function transfer(address recipient, uint value)public{
        balances[msg.sender]=balances[msg.sender].sub(value);
        balances[recipient]=balances[msg.sender].add(value);
    }
    
    function purchase() public payable{
        uint amount= msg.value *exchange_rate;
        balances[msg.sender]+=amount;
        provider.transfer(msg.value);
    }
    
    function mint(address recipient, uint value) public{
        require(msg.sender==provider, "You can't mint Access ACS tokens");
        balances[recipient]+=value;
    }
    
}