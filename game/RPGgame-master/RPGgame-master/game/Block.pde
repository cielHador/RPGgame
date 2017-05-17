class Block {
  //data
  float h, w;
  float randomPointX = random(1500);
  float randomPointY = random(-40, -80);
  float x, y, speed;
  int counter;
  float blockColorRed, blockColorGreen, blockColorBlue;
  float newSpawnPointForX;
  PImage firstMove, secondMove, thirdMove;
  int state;
  int timeElapsed;
  int timeFrameOneIsOn, timeFrameTwoIsOn, timeFrameThreeIsOn;


  //constructor
  Block() {
    timeElapsed = 0;
    timeFrameOneIsOn = 200;
    timeFrameTwoIsOn = 200;
    timeFrameThreeIsOn = 200;
    firstMove = loadImage("move1.png");
    secondMove = loadImage("move2.png");
    thirdMove = loadImage("move3.png");
    newSpawnPointForX = 1200;
    x = newSpawnPointForX;
    y = height-40/2;
    h = 20;
    w = 40;  
    speed = 5;
    counter = 0;
    blockColorRed = 0;
    blockColorGreen = 0;
    blockColorBlue = 0;
    state = 0;
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
    blockColorRed = 150;
    x = newSpawnPointForX;
    speed = 5; 
    blockColorRed = 0;
    blockColorBlue = 0;
    blockColorGreen = 0;
  }

  void blockSpeed() {
    x = x - speed;
  }



  void blockAdder() {
    block.add(new Block());
  }



  void handlePauseBlock() {
    speed = 0;
    playerOne.gravity = 100;
  }
  void handleUnpauseBlock() {
    speed = 5;
    playerOne.gravity = 0.2;
  }

  void handleKeyPressedForBlock() {
  }
  void frameOneChange() {
    image(firstMove, x, y);
  }

  void frameTwoChange() {
    image(secondMove, x, y);
  }
  void frameThreeChange() {
    image(thirdMove, x, y);
  }
  
  
  
  
}