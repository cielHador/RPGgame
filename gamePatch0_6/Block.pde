class Block {
  //data
  float h, w;
  float randomPointX = random(1500);
  float randomPointY = random(-40, -80);
  float x, y, speed;
  int counter;
  float blockColorRed, blockColorGreen, blockColorBlue;
  float newSpawnPointForX;
  PImage moveOne, moveTwo, moveThree;
  int timeElapsed, timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn;


  //constructor
  Block() {
    newSpawnPointForX = 1200;
    x = newSpawnPointForX;
    y = height-40/2;
    h = 20;
    w = 40;  
    speed = 5;
    //counter = 0;
    blockColorRed = 150;
    blockColorGreen = 0;
    blockColorBlue = 0;
    moveOne = loadImage("move1.png");
    moveTwo = loadImage("move2.png");
    moveThree = loadImage("move3.png");
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;
  }


  //behaviour
  void displayBlockX() {
    determineState();
    useCorrectFrame();
    blockSpeed();
    noFill();
    if (x <= 0-20) {
      //x = width+randomPointX;
      x = newSpawnPointForX;
    }
  }


  void restartBlock() {
    blockColorRed = 0;
    x = newSpawnPointForX+1500;
    speed = 5; 
    bat.x = 4000;
    boxKnife.knifeCount = 0;
  }
  

  void blockSpeed() {
    if (playerOne.gravity == 100 || playerOne.gravity == 99) {
      speed = 0; 
      newChest.speed = 0;
      bat.speed = 0;
    } else {
      x = x - speed;
      bat.speed = 3;
      newChest.speed = 5;
    }
  }


  void blockAdder() {
    block.add(new Block());
  }


  void handlePauseBlock() {
    newChest.speed = 0;
    bat.speed = 0;
    playerOne.gravity = 99;
    speed = 0;
    boxKnife.speed = 0;
  }


  void handleUnpauseBlock() {
    newChest.speed = 5;
    bat.speed = 3;
    playerOne.gravity = 0.2;
    speed = 5;
    boxKnife.speed = 7;
  }


  void handleKeyPressedForBlock() {
  }

  void determineState() {
    int timeToWait = 0;
    if (state == 0) {
      timeToWait = timeFrameOneIsOn;
    } else if (state == 1) {
      timeToWait = timeFrameTwoIsOn;
    } else if (state == 2) {
      timeToWait = timeFrameThreeIsOn;
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
    image(moveOne, x, y);
  }

  void frameTwoChange() {
    image(moveTwo, x, y);
  }
  void frameThreeChange() {
    image(moveThree, x, y);
  }
  void collisionDetectionKnife(Knife theKnife) {
    if (circleRect(x, y, w, theKnife.x, theKnife.y, theKnife.w, theKnife.h) ==true) {
      knife.x = 9000;
      x = newSpawnPointForX;
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