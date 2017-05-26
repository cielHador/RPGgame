class Menu {
  Menu() {
  }


  void startGame() {
    if (playerOne.counter <= 5000) {
      background(backgroundSet);
    } else if (playerOne.counter >= 5001) {
      background(menuScreenChange);
    }
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
      playerOne.display();
    }
  }

  void handleMenuButtonPressed() {
  }

  void menuScreenStart() {
    background(menuScreenStart);
    fill(0);
    rect(CENTER+390, CENTER+102, 215, 500, 10);
    fill(255);
    textSize(20);
    text("Press z to play!", 430, 150);
    text("Press t to throw", 430, 180);
    text("a knife! If over", 430, 200);
    text("Space to jump!", 430, 260);
    text("Press r to restart!", 430, 290);

    textSize(15);
  }

  void menuScreenChanger() {
    background(menuScreenChange);
  }
}