class Player {
  //data
  Minim minim;
  float xPos, yPos, pColor, dx, dy;
  float xSpeed, ySpeed;
  float playerWidth, playerHeight;
  float jumpHeight;
  float downForce = 2;
  float xAcceleration, yAcceleration;
  float gravity;
  int state;
  int counter;
  PImage frameOne, frameTwo, frameThree, walkNewOne, walkNewTwo, walkNewThree, walkAnotherOne, walkAnotherTwo, walkAnotherThree, 
    walkPurpleGirlOne, walkPurpleGirlTwo, walkPurpleGirlThree;
  int num = 1;
  int frameCounter;
  int timeElapsed, selector;
  int timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn, timeSoundIsOnOne;
  int textX;


  //constructor
  Player() {
    selector = 0;
    state = 0;
    timeElapsed = 0;
    timeSoundIsOnOne = 25000;
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;

    frameOne = loadImage("frame1.png");
    frameTwo = loadImage("frame2.png");
    frameThree  = loadImage("frame3.png");

    walkNewOne = loadImage("walkNew1.png");
    walkNewTwo = loadImage("walkNew2.png");
    walkNewThree = loadImage("walkNew3.png");

    walkAnotherOne = loadImage("moveGone.png");
    walkAnotherTwo = loadImage("moveGtwo.png");
    walkAnotherThree = loadImage("moveGthree.png");

    walkPurpleGirlOne = loadImage("walkPurpleOne.png");
    walkPurpleGirlTwo = loadImage("walkPurpleTwo.png");
    walkPurpleGirlThree = loadImage("walkPurpleThree.png");


    playerWidth = 20;
    playerHeight = 20;

    textX = width/2;

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
  void playSong() {
    //int timeToWait = 0;

    //if (timeToWait == 0) {
    //  musicOne.play();
    //  if (counter == 1000) {
    //    musicTwo.play();
    //  }
    //}
  }

  void determinePlayer() {
    if (selector == 1) {
    }
  }


  void determineStateFour() {
    if (selector == 3) {
      int timeToWait = 0;
      if (state == 0) {
        timeToWait = timeFrameOneIsOn;
        walkOneStep.play();
      } else if (state == 1) {
        timeToWait = timeFrameTwoIsOn;
      } else if (state == 2) {
        timeToWait = timeFrameThreeIsOn;
        walkOneStep.rewind();
      }


      if (millis() >= timeElapsed + timeToWait) {
        state++;
        if (state == 3) {
          state = 0;
        }
        timeElapsed = millis();
      }
    }
  }

  void determineStateThree() {
    if (selector == 2) {
      int timeToWait = 0;
      if (state == 0) {
        timeToWait = timeFrameOneIsOn;
        walkOneStep.play();
      } else if (state == 1) {
        timeToWait = timeFrameTwoIsOn;
      } else if (state == 2) {
        timeToWait = timeFrameThreeIsOn;
        walkOneStep.rewind();
      }



      if (millis() >= timeElapsed + timeToWait) {
        state++;
        if (state == 3) {
          state = 0;
        }
        timeElapsed = millis();
      }
    }
  }



  void determineStateTwo() {
    if (selector == 1) {
      int timeToWait = 0;
      if (state == 0) {
        timeToWait = timeFrameOneIsOn;
        walkOneStep.play();
      } else if (state == 1) {
        timeToWait = timeFrameTwoIsOn;
      } else if (state == 2) {
        timeToWait = 0;
        walkOneStep.rewind();
      }



      if (millis() >= timeElapsed + timeToWait) {
        state++;
        if (state == 3) {
          state = 0;
        }
        timeElapsed = millis();
      }
    }
  }


  void determineState() {
    if (selector == 0) {
      int timeToWait = 0;
      if (state == 0) {
        timeToWait = timeFrameOneIsOn;
        walkOneStep.play();
      } else if (state == 1) {
        timeToWait = timeFrameTwoIsOn;
      } else if (state == 2) {
        timeToWait = timeFrameTwoIsOn;
        walkOneStep.rewind();
      }


      if (millis() >= timeElapsed + timeToWait) {
        state++;
        if (state == 3) {
          state = 0;
        }
        timeElapsed = millis();
      }
    }
  }

  void useCorrectFrameFour() {
    if (selector == 3) {
      if (state == 0) {
        purpleGirlFrameOne();
      } else if (state == 1) {
        purpleGirlFrameTwo();
      } else if (state == 2) {
        purpleGirlFrameThree();
      }
    }
  }


  void useCorrectFrameThree() {
    if (selector == 2) {
      if (state == 0) {
        anotherFrameChangeOne();
      } else if (state == 1) {
        anotherFrameChangeTwo();
      } else if (state == 2) {
        anotherFrameChangeThree();
      }
    }
  }


  void useCorrectFrameTwo() {
    if (selector == 1) {
      if (state == 0) {
        frameOneChangeTwo();
      } else if (state == 1) {
        frameTwoChangeTwo();
      } else if (state == 2) {
        frameThreeChangeTwo();
      }
    }
  }





  void useCorrectFrame() {
    if (selector == 0) {
      if (state == 0) {
        frameOneChange();
      } else if (state == 1) {
        frameTwoChange();
      } else if (state == 2) {
        frameThreeChange();
      }
    }
  }

  //behaviour  
  void display() {
    if (gravity == 0.2) {
      textX = width/2;
    } else {
      textX = 9000;
    }

    determineState();
    useCorrectFrame();

    determineStateTwo();
    useCorrectFrameTwo();

    determineStateThree();
    useCorrectFrameThree();

    determineStateFour();
    useCorrectFrameFour();
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
      newChest.speed = 0;
      bat.speed = 0;
      boxKnife.speed = 0;
    }
    text("Press o to visit the shop!", textX, height/3-50);
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
    if (gravity == 100) {
      if (norseBackground == true) {
        fill(0); 
        text("GAME OVER", width/2, 40);
        text("PRESS R TO RESTART", width/2, 60);
      } else {
        fill(255);
        text("GAME OVER", width/2, 40);
        text("PRESS R TO RESTART", width/2, 60);
      }
    }
  }
  void restartGamePressed() {
    gravity = 0.2;
    counter = 0;
    newChest.speed = 5;
    newChest.x = 5000;
    bat.speed = 3;
    bat.x = 4000;
    textX = width/2;
    boxKnife.speed = 7;
    boxKnife.x = 2500;
  }

  void displayCounter() {
    if (norseBackground == true) {
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
    } else {
      textSize(14);
      fill(255);
      textAlign(CENTER, CENTER);
      text(counter, width/2, height/2);
      if (gravity ==0.2) {
        counter = counter + 1;
      }
      if (gravity == 100) {
        counter = counter + 0;
      }
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





  void frameOneChangeTwo() {
    image(walkNewOne, xPos-19, yPos-40);
  }

  void frameTwoChangeTwo() {
    image(walkNewTwo, xPos-20, yPos-40);
  }

  void frameThreeChangeTwo() {
  }





  void anotherFrameChangeOne() {
    image(walkAnotherOne, xPos-20, yPos-38);
  }

  void anotherFrameChangeTwo() {
    image(walkAnotherTwo, xPos-20, yPos-38);
  }

  void anotherFrameChangeThree() {
    image(walkAnotherThree, xPos-20, yPos-38);
  }






  void purpleGirlFrameOne() {
    image(walkPurpleGirlOne, xPos-20, yPos-36);
  }

  void purpleGirlFrameTwo() {
    image(walkPurpleGirlTwo, xPos-20, yPos-36);
  }

  void purpleGirlFrameThree() {
    image(walkPurpleGirlThree, xPos-20, yPos-36);
  }





  void selectorOne() {
    selector = 1;
  }
  void selectorZero() {
    selector = 0;
  }
  void selectorTwo() {
    selector = 2;
  }
  void selectorThree() {
    selector = 3;
  }
}