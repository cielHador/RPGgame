class Chest {
  //data
  int speed, state, timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn, timeFrameFourIsOn, timeElapsed;
  float x, y, w, h;
  PImage frameOne, frameTwo, frameThree, frameFour, chestPic;
  int coin;



  //behaviour
  Chest() {


    coin = 0;
    JSONObject savedCoins = loadJSONObject("data/coins.json");
    coin = savedCoins.getInt("coins");

    chestPic = loadImage("sma_chest_nearest_16x.png");
    frameOne = loadImage("chestOne.png");
    frameTwo = loadImage("chest2.png");
    frameThree = loadImage("chest1.png");
    frameFour = loadImage("chest4.png");

    speed = 5;
    state = 0;

    timeElapsed = 0;
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;
    timeFrameFourIsOn = 200;
    y = height-20/2;
    x = 1000;
    w = 20;
    h = 20;
  }



  //constructor



  void display() {
    if (playerOne.counter >= 200) {
      chestPic.resize(20, 20);
      image(chestPic, x-10, y-10);
      x = x - speed;
      if (x <= -20) {
        x = 5000;
      }
    }
  }


  void determineState() {
    int timeToWait = 0;
    if (state == 0) {
      timeToWait = timeFrameOneIsOn;
    } else if (state == 1) {
      timeToWait = timeFrameTwoIsOn;
    } else if (state == 2) {
      timeToWait = timeFrameTwoIsOn;
    }

    if (millis() >= timeElapsed + timeToWait) {
      state++;
      if (state == 3) {
        state = 0;
      }
      timeElapsed = millis();
    }
  }
  void useCorrectFrame() {
    if (state == 0) {
      frameOneChange();
    } else if (state == 1) {
      frameTwoChange();
    } else if (state == 2) {
      frameThreeChange();
    }
  }

  void frameOneChange() {
    image(frameOne, x, y);
  }

  void frameTwoChange() {
    image(frameTwo, x, y);
  }
  void frameThreeChange() {
    image(frameThree, x, y);
  }

  void spawnChest() {
    if (playerOne.counter >= 500) {
      x = x - speed;
    }
  }



  void showCoins() {
    fill(255);
    text("Current coin count!", width/2, CENTER+height/2+25);
    text(coin, CENTER+width/2, CENTER+height/2+40);
  }


  void collisionDetection(Player playerOne) {
    if (circleRect(x, y, w/2, playerOne.xPos, playerOne.yPos, playerOne.playerWidth, playerOne.playerHeight) ==true) {
      coin = coin + 1;
      coinSound.play();
      coinSound.rewind();
      x = 5000;
    }
  }


  // the following is from: http://www.jeffreythompson.org/collision-detection/circle-rect.php
  // I used it to save my brain from math.
  // CIRCLE/RECTANGLE/TRIANGLE(?)
  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }
}