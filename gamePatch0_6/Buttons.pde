class Buttons {


  Buttons() {
  }

  void buttonsToPress() {
    if (key == '1' && boxKnife.knifeCount >= 1 && rStart == true) {
      theShop.counterPlus2000();
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
    if (playerOne.counter >= 100) {
      if (key == 't' && knife.x >= 100) {
        knife.throwKnife();
      }
    }


    playerOne.handleKeyPressed();
    if (key == ' ') {
      playerOne.jump();
      jump.play();
      jump.rewind();
    }


    if (key == 'i') {
      start = false;
      rStart = false;
      hStart = true;
      newChest.speed = 0;
      newChest.x = 5000;
      bat.speed = 0;
      bat.x = 4000;
      playerOne.counter = playerOne.counter + 0;
      for (Block theBlock : block) { 
        theBlock.restartBlock();
      }
    }

    if (key == 's') {
      start = true;
      rStart = false;
      hStart = false;
      newChest.speed = 5;
      newChest.x = 5000;
      bat.speed = 3;
      bat.x = 4000;
    }

    if (start==false) {
    }

    if (key == 'o') {
      rStart = true;
      start = false;
      hStart = false;
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
        if (key == 'a') {
          theBlock.handlePauseBlock(); //This pauses the game
          myScore.stopTheScore();
        }
        if (key == 'd') {
          theBlock.handleUnpauseBlock();
        }
      }
    }
  }
}