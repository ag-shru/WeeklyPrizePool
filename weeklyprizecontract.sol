pragma solidity ^0.8.0;

contract WeeklyPrizePool {
    address[] public participants;
    address public lastWinner;
    uint256 public lastWinTime;
    uint256 public weekDuration = 7 days;
    
    function enter() public payable {
        require(msg.value > 0, "Must send ETH to enter");
        participants.push(msg.sender);
    }
    
    function selectWinner() public {
        require(block.timestamp >= lastWinTime + weekDuration, "A week has not passed yet");
        require(participants.length > 0, "No participants");
        
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, participants.length))) % participants.length;
        lastWinner = participants[randomIndex];
        
        payable(lastWinner).transfer(address(this).balance);
        lastWinTime = block.timestamp;
        
        delete participants;
    }
    
    function getParticipants() public view returns (address[] memory) {
        return participants;
    }
    
    function getPrizePool() public view returns (uint256) {
        return address(this).balance;
    }
}
