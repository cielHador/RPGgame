class Buttons {


  Buttons() {
  }

  void buttonsToPress() {

    if (key == '0') {
      playerOne.selectorOne();
    }
    if (key == '9') {
      playerOne.selectorZero();
    }
    if (key == '8') {
     playerOne.selectorTwo(); 
    }
    if (key == '7') {
     playerOne.selectorThree(); 
    }

    knife.handleKnifeButton();
    if (playerOne.counter >= 1000){
    if (key == 't' && knife.x >= 1000) {
      knife.throwKnife();
    }
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