pragma solidity ^0.5.0;

contract OurToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    address internal owner;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    uint256 internal num;
    uint256 public numGanador;
    bool public juego;
    address public ganador;
    uint256 public precio;


    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event Sold(address buyer, uint256 amount);

    constructor(uint256 _numGanador) public {
        name = "Gallo";
        symbol = "GALLO";
        decimals = 18;
        totalSupply = 1000 * (uint(10)** decimals);
        balanceOf[msg.sender] = totalSupply;
        numGanador = _numGanador;
        num= 1;
        juego = true;
        precio = 10 * (uint(10)** decimals);
        owner = msg.sender;
    }

    function transfer(address _to, uint _value) public returns (bool success){
        require(balanceOf[msg.sender]>= _value, "usted no cuenta con los fondos suficientes");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require (balanceOf[_from] >= _value, "la cuenta no dispone con los fondos suficientes");
        require(allowance[_from][msg.sender] >= _value,"usted no esta autorizado a transaccionar estos tokens");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function comprobarAcierto(uint256 _num) private view returns(bool){
        if (_num == numGanador){
            return true;
        }else{
            return false;
        }
    }

    function numeroRandom() private view returns(uint256){
        return uint256( keccak256(abi.encode(now, msg.sender, num))) %10;
    }

    function participar () external returns (bool resultado, uint256 numero){
        require (juego == true, "el juego ha terminado");
        require(balanceOf[msg.sender] > precio, "Usted no cuenta con los fondos suficientes");
        uint256 numUsuario = numeroRandom();
        bool acierto = comprobarAcierto(numUsuario);
        if (acierto == true){
            juego = false;
            approve(msg.sender, uint256(num * (precio)));
            ganador = msg.sender;
            resultado = true;
            numero = numUsuario;
        }
        else {
            num++;
            resultado = false;
            numero = numUsuario;
        }
    }

    function verPremio()  public view returns(uint256){
        return (precio * num);
    }

    function restablecerJuego () public{
        require(msg.sender == owner, "usted no tiene permiso para restablecer el juego");
        num = 1;
        juego = true;
    }
 
}