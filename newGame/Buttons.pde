class Buttons{
  
  
  Buttons(){
    
  }
  
 void buttonsToPress(){
   
    if (key == '0'){
        playerOne.selectorAdd();
    }
    if (key == '9'){
     playerOne.selectorSub(); 
    }
    
  
  
  playerOne.handleKeyPressed();
  if (key == ' ') {
    playerOne.jump();
    jump.play();
    jump.rewind();
  }

  if (key == 'z') {
    start = true;
  }

    if (start==false) {
    }

    for (Block theBlock : block) {
      if (key == 'r') {
        playerOne.restartGamePressed(); 
        theBlock.restartBlock();
      }

      if (myScore.theScore >= 139) {
        if (key == 'p') {
          theBlock.handlePauseBlock(); //This pauses the game
          myScore.stopTheScore();
        }
        if (key == 'l') {
          theBlock.handleUnpauseBlock();
        }
      }
    }
  }
 
 }
  
  