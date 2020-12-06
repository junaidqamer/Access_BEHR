pragma solidity ^0.5.5;

import "./AccessMint.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract AccessSales is Crowdsale, MintedCrowdsale {

    constructor(
        uint rate, // rate in TKNbits
        address payable wallet, // sale beneficiary
        AccessMint token // the AccessMint Token itself that the AccessSales will work with
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor is empty
    }
}

contract AccessSalesDeployer {

    address public access_sale_address;
    address public token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    )
        public
    {
        // create the AccessToken and keep its address available
        AccessMint token = new AccessMint(name, symbol, 0);
        token_address = address(token);

        // create the AccessSale and tell it about the token
        AccessSales access_sale = new AccessSales(1, wallet, token);
        access_sale_address = address(access_sale);

        // make the AccessSales contract a minter, then have the AccessSalesDeployer renounce its minter role
        token.addMinter(access_sale_address);
        token.renounceMinter();
    }
}
