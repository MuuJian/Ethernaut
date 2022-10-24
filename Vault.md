```C++

web3.eth.getStorageAt(instance, 1).then(web3.utils.toAscii).then(console.log);
contract.unlock(web3.utils.fromAscii("A very strong secret password :)"));


```