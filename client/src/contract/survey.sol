pragma solidity 0.8.9;

contract survey {
    
    address owner;
    //  
    
    // 중복체크 위해 사용 설문 번호=>유저 did or account => bool
    mapping (uint => mapping(address => bool)) public surveyUser;

    mapping (uint => mapping(address => mapping(address => string[]))) public whoCallVP;
    // 한번에 확인 할 수 있는 함수를 만들자

    mapping(uint => string) public companyPublic;

    event addUser(uint, address);
    event recordVPList(uint, address, address, string);

    constructor () {
        owner = msg.sender;
    }

    function recordVP (uint _surveyId, string memory _VPData, address _company) public {
         //  중복체크
        require(surveyUser[_surveyId][tx.origin] == false);
        surveyUser[_surveyId][tx.origin] = true;
        
        whoCallVP[_surveyId][_company][tx.origin].push(_VPData);
        

        emit addUser(_surveyId , tx.origin);
        // 디비저장       
        emit recordVPList(_surveyId , _company, tx.origin, _VPData);
        // 디비저장        
    }
    
    function companyEncrptPublic (uint _surveyId, string memory _publicKey)public {
        require(msg.sender == owner);
        companyPublic[_surveyId] = _publicKey;
    }
}