class Menu {
  Menu() {
  }


  void startGame() {
    if (changeDeer == true){
     background(deerBackground); 
     startBackground = false;
     changeCastle = false;
    }
    else if (startBackground == true){
    background(menuScreenChange);
    changeDeer = false;
    changeCastle = false;
    } 
    else if (changeCastle == true) {
      background(castleBackground);
      changeDeer = false;
      startBackground = false;
    }
    else if (changeOriginal == true) {
      background(backgroundSet);
    }
    else if (norseBackground == true){
      background(norseBackgroundChange);
    }
    else {
     background(backgroundSet); 
    }
    newNoise.startNoisesAndEnd();
    playerOne.gameOver();
    bat.gameOver();
    bat.display();
    newChest.showCoins();
    boxKnife.display();
    boxKnife.showKnives();
    playerOne.playSong();
    myScore.display();
    newChest.display();
    myScore.addPoints();
    myScore.displayTopScore();
    playerOne.move();  
    playerOne.displayCounter();
    playerOne.stopTheCounter();
    myScore.stopTheScore();
    knife.displayKnife();
    help.showHelpButton();
    for (Block theBlock : block) {
      theBlock.displayBlockX();
      playerOne.collisionDetection(theBlock);
      newChest.collisionDetection(playerOne);
      boxKnife.collisionDetection(playerOne);
      bat.collisionDetection(playerOne);
      theBlock.collisionDetectionKnife(knife);
      bat.collisionDetectionKnifeBat(knife);
      playerOne.display();
    }
  }

  void handleMenuButtonPressed() {
  }

  void menuScreenStart() {
    background(menuScreenStart);
    fill(0);
    rect(CENTER+390, CENTER-500, 215, 900, 10);
    fill(255);
    textSize(20);
    text("Press s to play!", 430, 60);
    text("Press t to throw", 430, 100);
    text("a knife!", 440, 125);
    text("Space to jump!", 430, 200);
    text("Press r to restart!", 420, 250);

    textSize(15);
  }

  void menuScreenChanger() {
    background(deerBackground);
  }
}