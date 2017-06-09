class Buttons {


  Buttons() {
  }

  void buttonsToPress() {

    menuScreen.handleMenuButtonPressed();
    if (key == 'n' && rStart == true && shopPageOne == false && newChest.coin >= 10) {
      theShop.buyBackgroundOne();
      changeDeer = true;
      changeCastle = false;
      startBackground = false;
      changeOriginal = false;
      norseBackground = false;
    }
    if (key == 'm' && rStart == true && shopPageOne == false && newChest.coin >= 10) {
      theShop.buyBackgroundThree();
      changeDeer = false;
      changeCastle = false;
      startBackground = true;
      changeOriginal = false;
      norseBackground = false;
    }
    if (key == 'b' && rStart == true && shopPageOne == false && newChest.coin >= 10) {
      theShop.buyBackgroundTwo();
      changeCastle = true;
      changeDeer = false;
      startBackground = false;
      changeOriginal = false;
      norseBackground = false;
    }
    if (key == 'v' && rStart == true && shopPageOne == false && newChest.coin >= 10) {
      theShop.buyBackgroundFour();
      changeOriginal = true;
      changeDeer = false;
      startBackground = false;
      changeCastle = false;
      norseBackground = false;
    }
    if (key == 'c'){
     norseBackground = true;
     changeDeer = false;
     changeOriginal = false;
     startBackground = false;
     changeCastle = false;
    }


    if (key == 'g') {
      shopPageOne = false;
      shopPageTwo = true;
    }
    if (key == 'f') {
      shopPageOne = true;
      shopPageTwo = false;
    }



    if (key == '1' && newChest.coin >= 1 && rStart == true && bought2000 == false) {
      bought2000 = true;
      theShop.counterPlus2000();
      monsterSoundScore.rewind();
      monsterSoundScore.play();
    }

    if (key == '2' && newChest.coin >= 2 && rStart == true && bought4000 == false) {
      bought4000 = true;
      theShop.counterPlus4000();
      monsterSoundScore.rewind();
      monsterSoundScore.play();
      if (playerOne.gravity == 100) {
        block.remove(1);
      }
    }

    if (key == '9' && newChest.coin >= -1 && rStart == true) {
      theShop.selectOriginal();
      playerOne.selectorZero();
    }
    if (key == '8' && newChest.coin >= 4 && rStart == true) {
      theShop.selectOrange();
      playerOne.selectorTwo();
    }
    if (key == '7' && newChest.coin >= 4 && rStart == true) {
      theShop.selectPurple();
      playerOne.selectorThree();
    }
    if (key == '3' && newChest.coin >= 2 && rStart == true) {
      theShop.buyKnives();
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
        theBlock.speed = 0;
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
      for (Block theBlock : block) { 
        theBlock.speed = 5;
      }
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
        theBlock.speed = 0;
      }
    }

    if (rStart == false) {
    }




    for (Block theBlock : block) {         
      if (key == 'r') {
        playerOne.restartGamePressed(); 
        theBlock.restartBlock();
        newChest.coin = 0;
        if (bought2000 == true && playerOne.gravity == 0.2) {
          block.remove(1);
          bought2000 = false;
        }
        if (bought4000 == true && playerOne.gravity == 0.2) {
          block.remove(1); 
          bought4000 = false;
        }
      }

      if (myScore.theScore >= 10) {
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