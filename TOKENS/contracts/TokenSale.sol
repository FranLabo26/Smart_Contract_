pragma solidity ^0.5.0;

interface OurToken{
    function decimals() external view returns(uint8);
    function balanceOf(address _address) external view returns(uint256);
    function transfer(address _to, uint _value) external returns (bool success);
    }

contract TokenSale{
    address owner;
    uint256 price;
    OurToken myTokenContract;
    uint256 tokensSold;

    event Sold(address buyer, uint256 amount);

    constructor(uint _price, address _addressContract) public payable{
        owner = msg.sender;
        price = _price;
        myTokenContract = OurToken(_addressContract);
    } 

    function mul(uint256 a, uint256 b) internal pure returns (uint256){
        if (a == 0){
            return 0;
        }
        uint c = a*b;
        require(c / a ==b);
        return c;
    }

    function buy(uint256 _numTokens) public payable {
        require(msg.value == mul(price, _numTokens));
        uint256 scaledAmount = mul(_numTokens, uint256(10) ** myTokenContract.decimals());
        require(myTokenContract.balanceOf(address(this)) >= scaledAmount);
        tokensSold += _numTokens;
        require(myTokenContract.transfer(msg.sender,scaledAmount));
        emit Sold(msg.sender, _numTokens);
    }

    function endSold() public {
        require(msg.sender == owner);
        require(myTokenContract.transfer(owner, myTokenContract.balanceOf(address(this))));
        msg.sender.transfer(address(this).balance);
    }

    }