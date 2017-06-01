class KnifeBox {
  //data
  int speed, state, timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn, timeFrameFourIsOn, timeElapsed;
  float x, y, w, h;
  PImage frameOne, frameTwo, frameThree, frameFour, knifeBox;
  int knifeCount;



  //behaviour
  KnifeBox() {


    knifeCount = 0;
    //JSONObject savedCoins = loadJSONObject("data/coins.json");
    //knifeCount = savedCoins.getInt("coins");

    knifeBox = loadImage("boxCardBoard.png");

    speed = 7;
    state = 0;

    timeElapsed = 0;
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;
    timeFrameFourIsOn = 200;
    y = height-40/2;
    x = 1000;
    w = 20;
    h = 20;
  }



  //constructor



  void display() {
    if (playerOne.counter >= 200) {
      knifeBox.resize(50, 50);
      image(knifeBox, x-40, y-22);
      x = x - speed;
      if (x <= -20) {
        x = 2500;
        println(x);
      }
    }
  }




  void spawnBox() {
    if (playerOne.counter >= 500) {
      x = x - speed;
    }
  }



  void showKnives() {
    fill(255);
    text("Knives", width/3+20, height/2+25);
    text(knifeCount, CENTER+width/3+20, CENTER+height/2+40);
  }


  void collisionDetection(Player playerOne) {
    if (circleRect(x, y, w/2, playerOne.xPos, playerOne.yPos, playerOne.playerWidth, playerOne.playerHeight) ==true) {
      knifeCount = knifeCount + 1;
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