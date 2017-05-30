import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float yPos, xPos;
boolean playerY, playerX, blocky, blockY;
int state;
float spotlightSize;
PImage backgroundSet, menuScreenStart, menuScreenChange;
Menu menuScreen;
Minim minim;
AudioPlayer song;
Player playerOne;
ArrayList<Block> block;
Score myScore;
Chest newChest;
AudioPlayer walkOneStep, walkTwoStep, walkThreeStep, jump, musicOne, musicTwo, noises, coinSound, monsterSoundScore;
boolean start, rStart;
Buttons button;
Noises newNoise;
Bat bat;
Knife knife;
Rorscharch rorscharch;
Shop theShop;


void setup() {
  size(1000, 300);
  minim = new Minim(this); 
  knife = new Knife();
  menuScreen = new Menu();
  newNoise = new Noises();
  musicOne = minim.loadFile("feedbackOSC.wav");
  musicTwo = minim.loadFile("boat.wav");
  noises = minim.loadFile("rain.mp3");
  walkOneStep = minim.loadFile("step_cloth1.mp3");
  jump = minim.loadFile("jumpland44100.mp3");
  monsterSoundScore = minim.loadFile("monsterSound.mp3");
  start = false;
  coinSound = minim.loadFile("coinSound.wav");
  menuScreenStart = loadImage("menuScreen.jpg");
  menuScreenChange = loadImage("backgroundRPG.jpg");
  backgroundSet = loadImage("newBackgroundTwo.png");
  myScore = new Score();
  playerOne = new Player();
  newChest = new Chest();
  state = 0;
  spotlightSize = 200;
  block = new ArrayList<Block>();
  block.add(new Block());
  button = new Buttons();
  bat = new Bat();;
  rorscharch = new Rorscharch();
  theShop = new Shop();
}

void draw() {
  menuScreen.menuScreenStart();
  if (start == true)     
    menuScreen.startGame();
  if (rStart == true) {
   theShop.buyTest();
  }
}
void keyPressed() {
  button.buttonsToPress();
}
void collisionDetection() {
}