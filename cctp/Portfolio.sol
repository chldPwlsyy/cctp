pragma solidity ^0.4.19;

contract Portfolio {

    //계약을 배포한 계정 주소(cctp)
    address public owner;

    function Portfolio() public{
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Ptf{
        uint id;
        string userid;
        string ptfid;
        string reftime;
        string profit;
    }

    //Ptf[] public ptflo;

    mapping(uint => Ptf ) public ptflo;

    function setPtflo(uint _id, string _userid, string _ptfid, string _reftime, string _profit) external onlyOwner{

        ptflo[_id].id = _id;
        ptflo[_id].userid = _userid;
        ptflo[_id].ptfid = _ptfid;
        ptflo[_id].reftime = _reftime;
        ptflo[_id].profit = _profit;

    }


    function getPtflo(uint _id) public view returns (uint, string, string, string, string) {
        return (ptflo[_id].id, ptflo[_id].userid, ptflo[_id].ptfid, ptflo[_id].reftime, ptflo[_id].profit);

    }

}
