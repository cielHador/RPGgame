float yPos, xPos;
boolean playerY, playerX, blocky, blockY;
int state;
float spotlightSize;
PImage backgroundSet;


Player playerOne;
ArrayList<Block> block;
Score myScore;

void setup() {
  size(1000, 300);
  backgroundSet = loadImage("backgroundRPG.jpg");
  myScore = new Score();
  playerOne = new Player();
  state = 0;
  spotlightSize = 200;
  block = new ArrayList<Block>();
  block.add(new Block());
}

void draw() {
  background(backgroundSet);
  if (myScore.theScore == 140) {
    block.add(new Block());
  }
  myScore.display();
  myScore.addPoints();
  myScore.displayTopScore();
  playerOne.move();  
  playerOne.displayCounter();
  playerOne.stopTheCounter();
  myScore.stopTheScore();
  for (Block theBlock : block) {
    theBlock.displayBlockX();
    playerOne.collisionDetection(theBlock);
    playerOne.display();
  }
}


void keyPressed() {

  playerOne.handleKeyPressed();
  if (key == ' ') {
    playerOne.jump();
  }
  for (Block theBlock : block) {
    if (key == 'r') {
      playerOne.restartGamePressed(); 
      theBlock.restartBlock();
    }
    //if (myScore.theScore >= 138) {
    //  theBlock.handleKeyPressedForBlock();  //This changes the color of the block using the same type of jumping
    //  if (key == '1') {                     //code from handleKeyPressed in the class Player
    //    theBlock.blockColorBlue();          //and using it in a color changing format
    //  }                                     //CHANGE 0.1
    //  theBlock.handleKeyPressedForBlock();  //Now when it reaches past 138, you are allowed to change the color of the blocks
    //  if (key == '2') {                     //this prevents a single block from being red, and another being a seperate color.
    //    theBlock.blockColorGreen();
    //  }
    //  theBlock.handleKeyPressedForBlock();
    //  if (key == '3') {
    //    theBlock.blockColorRed();
    //  }
    //} 
    if (myScore.theScore >= 139) {
      if (key == 'p') {
        theBlock.handlePauseBlock(); //This pauses the game
        myScore.stopTheScore();
      }
      if (key == 'l') {
        theBlock.handleUnpauseBlock();
      }
    }
  }
}



void collisionDetection() {
}