class Buttons {


  Buttons() {
  }

  void buttonsToPress() {
    if (key == ',' && newChest.coin >= 1 && rStart == true) {
      theShop.speedTo2000();
    }



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
    if (playerOne.counter >= 1000) {
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
      rStart = false;
      newChest.speed = 5;
      newChest.x = 5000;
      bat.speed = 5;
      bat.x = 4000;
    }

    if (start==false) {
    }

    if (key == 'o') {
      rStart = true;
      start = false;
      newChest.speed = 0;
      newChest.x = 5000;
      bat.speed = 0;
      bat.x = 4000;
      playerOne.counter = playerOne.counter + 0;
      for (Block theBlock : block) { 
        theBlock.restartBlock();
      }
    }

    if (rStart == false) {
    }


    for (Block theBlock : block) {         
      if (key == 'r') {
        playerOne.restartGamePressed(); 
        theBlock.restartBlock();
        newChest.coin = 0;
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