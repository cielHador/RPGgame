class Menu {
  Menu() {
  }


  void startGame() {
      background(backgroundSet);
    if (myScore.theScore == 140) {
      block.add(new Block());
    }
    newNoise.startNoisesAndEnd();
    playerOne.gameOver();
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
    text("Press z to play!", 430, 60);
    text("Press t to throw", 430, 100);
    text("a knife! If over", 435, 120);
    text("1000!", 470, 140);
    text("Space to jump!", 430, 200);
    text("Press r to restart!", 420, 250);

    textSize(15);
  }

  void menuScreenChanger() {
    background(menuScreenChange);
  }
}