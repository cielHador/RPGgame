class Shop {
  PImage orangeChar, purpleChar, originalChar, backgroundDeerView, backgroundCastleView, backgroundGrassView, originalBackgroundView, backgroundNorseView;
  //boolean shopPageOne, shopPageTwo;
  Shop() {
    orangeChar = loadImage("moveGone.png");
    purpleChar = loadImage("walkPurpleOne.png");
    originalChar = loadImage("frame1.png");
    backgroundDeerView = loadImage("deerBackground.jpg");
    backgroundCastleView = loadImage("castleBackground.jpg");
    backgroundGrassView = loadImage("backgroundRPG.jpg");
    originalBackgroundView = loadImage("newBackgroundTwo.png");
    backgroundNorseView = loadImage("norseBackground.jpg");
  }

  void buyTest() {
    if (rStart == true) {
      background(menuScreenStart);
      text("Current coin count!", width/2, CENTER+10);
      text(newChest.coin, width/2, CENTER+30);
      if (shopPageOne == true) {
        if (bought2000 == false) {
          fill(255);
          text("ADD 2000 TO SCORE [ 1 COIN | PRESS '1' TO PURCHASE ]", width/2, CENTER+60);
        } else { 
          fill(0);
          text("ADD 2000 TO SCORE [ 1 COIN | PRESS '1' TO PURCHASE ]", width/2, CENTER+60);
        }
        if (bought4000 == false) {
          fill(255);
          text("ADD 4000 TO SCORE [ 2 COINS | PRESS '2' TO PURCHASE ]", width/2, CENTER+90);
        } else {
          fill(0);
          text("ADD 4000 TO SCORE [ 2 COINS | PRESS '2' TO PURCHASE ]", width/2, CENTER+90);
        }
        fill(255);
        text("NEW CHARACTER [ 4 COINS | PRESS '8' TO PURCHASE ]", width/2, CENTER+120);
        text("NEW CHARACTER [ 4 COINS | PRESS '7' TO PURCHASE ]", width/2, CENTER+150);
        text("RETURN TO OLD CHARACTER [ 0 COINS | PRESS '9' TO PURCHASE]", width/2, CENTER+180);
        text("BUY 10 KNIVES [ 2 COINS | PRESS '3' TO PURCHASE]", width/2, CENTER+210);
        orangeChar.resize(30, 30);
        image(orangeChar, width/2+210, CENTER+105);
        purpleChar.resize(30, 30);
        image(purpleChar, width/2+210, CENTER+135);
        originalChar.resize(50, 50);
        image(originalChar, width/2+250, CENTER+150);
        fill(0);
        rectMode(CENTER);
        rect(width/2, height-15/2, 200, 20, 7);
        fill(255);
        text("Press s to leave shop", width/2, height-20/2);
        text("Page 2 'g'", width/2+450, height-25/2);
      }
    }
    if (shopPageOne == false && shopPageTwo == true) {
      text("BUY BACKGROUND ONE [ 10 COINS | PRESS 'n' TO PURCHASE ]", width/2, CENTER+60); 
      backgroundDeerView.resize(60, 30);
      image(backgroundDeerView, width/2+250, CENTER+50);
      text("BUY BACKGROUND TWO [ 10 COINS | PRESS 'b' TO PURCHASE ]", width/2, CENTER+90);
      backgroundCastleView.resize(60, 30);
      image(backgroundCastleView, width/2+250, CENTER+80);
      text("BUY BACKGROUND THREE [ 10 COINS | PRESS 'm' TO PURCHASE ]", width/2, CENTER+120);
      backgroundGrassView.resize(60, 30);
      image(backgroundGrassView, width/2+250, 110);
      text("BUY BACKGROUND FOUR [ 10 COINS | PRESS 'v' TO PURCHASE ]", width/2, CENTER+150);
      originalBackgroundView.resize(60, 30);
      backgroundNorseView.resize(60, 30);
      text("BUY BACKGROUND FIVE [ 20 COINS | PRESS 'c' TO PURCHASE ]", width/2, CENTER+180);
      image(backgroundNorseView, width/2+250, 170);
      image(originalBackgroundView, width/2+250, 140);
      text("Page 1 'f'", width/2+450, height-25/2);
      fill(0);
      rectMode(CENTER);
      rect(width/2, height-15/2, 200, 20, 7);
      fill(255);
      text("Press s to leave shop", width/2, height-20/2);
    }
  }
  void counterPlus2000() {
    newChest.coin = newChest.coin - 1; 
    start = true;
    rStart = false;
    playerOne.counter = playerOne.counter + 2000;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    block.add(new Block());
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void counterPlus4000() {
    newChest.coin = newChest.coin - 2; 
    start = true;
    rStart = false;
    playerOne.counter = playerOne.counter + 4000;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    block.add(new Block());
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }
  void selectOrange() {
    newChest.coin = newChest.coin - 4; 
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void selectPurple() {
    newChest.coin = newChest.coin - 4; 
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void selectOriginal() {
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }


  void buyKnives() {
    newChest.coin = newChest.coin - 2;
    boxKnife.knifeCount = boxKnife.knifeCount + 10;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void buyBackgroundOne() {
    newChest.coin = newChest.coin - 10;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void buyBackgroundTwo() {
    newChest.coin = newChest.coin - 10;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void buyBackgroundThree() {
    newChest.coin = newChest.coin - 10;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }

  void buyBackgroundFour() {
    newChest.coin = newChest.coin - 10;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }
  void buyBackgroundFive() {
    newChest.coin = newChest.coin - 20;
    start = true;
    rStart = false;
    playerOne.gravity = 0.2;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    for (Block theBlock : block) { 
      theBlock.speed = 5;
    }
  }
}