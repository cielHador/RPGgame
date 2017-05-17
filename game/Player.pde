class Player {
  //data
  float xPos, yPos, pColor, dx, dy;
  float xSpeed, ySpeed;
  float playerWidth, playerHeight;
  float jumpHeight;
  float downForce = 2;
  float xAcceleration, yAcceleration;
  float gravity;
  int state;
  int counter;
  PImage frameOne, frameTwo, frameThree;
  int num = 1;
  int frameCounter;
  int timeElapsed;
  int timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn;


  //constructor
  Player() {
    state = 0;

    timeElapsed = 0;
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;

    frameOne = loadImage("frame"+num+".png");
    frameTwo = loadImage("frame2.png");
    frameThree  = loadImage("frame3.png");

    playerWidth = 20;
    playerHeight = 20;
    xSpeed = 3;
    ySpeed = 3;
    pColor = (160);
    xPos = width/2;
    yPos = height-playerHeight/2;
    dx = 0;
    dy = 0;
    xAcceleration = 0;
    yAcceleration = 0;
    jumpHeight = 0.001;
    gravity = 0.2;
    state = 0;
    counter = 0;
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

  //behaviour  
  void display() {
    determineState();
    useCorrectFrame();
  }  
  void move() {
    dy += yAcceleration;                               //acceleration changes the velocity
    yPos += dy;                                        //velocity changes the location  
    dy += gravity;
    yPos = constrain(yPos, 0, height-playerHeight/2);  //stay on screen 
    if (yPos == height-playerHeight/2) {               // if at bottom of screen
      dy = 0;
    }
    yAcceleration = 0;
  }

  void handleKeyPressed() {
  }
  void jump() {
    if (yPos == 290) {
      yAcceleration = -4;
    } else { 
      yAcceleration = 0;
    }
  }



  void collisionDetection(Block theBlock) {
    if (circleRect(xPos, yPos, playerWidth/2, theBlock.x, theBlock.y, theBlock.w, theBlock.h) ==true) {
      theBlock.speed = 0;
      gravity = 100;
      gameOver();
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

  void gameOver() {
    fill(0);
    text("GAME OVER", width/2, 40);
    text("PRESS R TO RESTART", width/2, 60);
  }
  void restartGamePressed() {
    gravity = 0.2;
    counter = 0;
  }

  void displayCounter() {
    textSize(14);
    fill(0);
    textAlign(CENTER, CENTER);
    text(counter, width/2, height/2);

    if (gravity ==0.2) {
      counter = counter + 1;
    }


    if (gravity == 100) {
      counter = counter + 0;
    }
  }
  void addNewBlock() {
  }
  void stopTheCounter() {
    counter = counter + 0;
  }
  void frameOneChange() {
    image(frameOne, xPos-20, yPos-47);
  }

  void frameTwoChange() {
    image(frameTwo, xPos-20, yPos-47);
  }
  void frameThreeChange() {
    image(frameThree, xPos-20, yPos-47);
  }
}