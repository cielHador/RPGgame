class Menu {



  Menu() {
  }


  void startGame() {
    background(backgroundSet);
    if (myScore.theScore == 140) {
      block.add(new Block());
    }
    newNoise.startNoisesAndEnd();
    bat.gameOver();
    bat.display();
    newChest.showCoins();
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
    for (Block theBlock : block) {
      theBlock.displayBlockX();
      playerOne.collisionDetection(theBlock);
      newChest.collisionDetection(playerOne);
      bat.collisionDetection(playerOne);
      theBlock.collisionDetectionKnife(knife);
      playerOne.display();
    }
  }

  void handleMenuButtonPressed() {
  }

  void menuScreenStart() {
    background(menuScreenStart);
    fill(0);

    rect(CENTER+390, CENTER+102, 215, 75, 10);
    fill(255);
    textSize(20);
    text("Press z to play!", 430, 150);
    textSize(15);
  }
}