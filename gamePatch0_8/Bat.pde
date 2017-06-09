class Bat {
  float x, y, w, h;
  int speed;
  PImage batMoveOne, batMoveTwo, batMoveThree;
  int timeFrameOneIsOnBat, timeFrameTwoIsOnBat, timeFrameThreeIsOnBat, timeElapsedBat, state;


  Bat() {
    timeFrameOneIsOnBat = 500;
    timeFrameThreeIsOnBat = 500;
    timeFrameThreeIsOnBat = 500;
    y = height-125/2;
    x = 4000;
    w = 20;
    h = 20;
    speed = 3;
    batMoveOne = loadImage("batTwo.png");
    batMoveTwo = loadImage("batTwo.png");
    batMoveThree = loadImage("batThree.png");
  }


  void display() {
    useCorrectFrameBat();
    determineStateBat();
    x = x - speed;
    if (x <= -40) {
      x = 4000;
    }
  }

  void gameOver() {
  }




  void collisionDetection(Player playerOne) {
    if (circleRect(playerOne.xPos, playerOne.yPos, playerOne.playerWidth/2, x, y, w, h) ==true) {
      playerOne.gravity = 100;
      playerOne.gameOver();
      newChest.speed = 0;
      speed = 0;
      boxKnife.speed = 0;
    }
  }

  void collisionDetectionKnifeBat(Knife theKnife) {
    if (circleRect(x, y, w, theKnife.x, theKnife.y, theKnife.w, theKnife.h) ==true) {
      knife.x = 9000;
      x = 4000;
    }
  }

  void useCorrectFrameBat() {
    if (state == 0) {
      frameOneChange();
    } else if (state == 1) {
      frameTwoChange();
    } else if (state == 2) {
      frameThreeChange();
    }
  }

  void determineStateBat() {
    int timeToWaitBat = 0;
    if (state == 0) {
      timeToWaitBat = timeFrameOneIsOnBat;
    } else if (state == 1) {
      timeToWaitBat = timeFrameTwoIsOnBat;
    } else if (state == 2) {
      timeToWaitBat = timeFrameThreeIsOnBat;
    }

    if (millis() >= timeElapsedBat + timeToWaitBat) {
      state++;
      if (state == 3) {
        state = 0;
      }
      timeElapsedBat = millis();
    }
  }



  void frameOneChange() {
    image(batMoveOne, x-10, y-10);
  }

  void frameTwoChange() {
    image(batMoveTwo, x-10, y-10);
  }
  void frameThreeChange() {
    image(batMoveThree, x-10, y-10);
  }


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