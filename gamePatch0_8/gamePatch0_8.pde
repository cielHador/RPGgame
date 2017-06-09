import ddf.minim.*;

float yPos, xPos;
boolean playerY, playerX, blocky, blockY;
int state;
float spotlightSize;
PImage backgroundSet, menuScreenStart, menuScreenChange, deerBackground, castleBackground, norseBackgroundChange;
Menu menuScreen;
Minim minim;
AudioPlayer song;
Player playerOne;
ArrayList<Block> block;
Score myScore;
Chest newChest;
AudioPlayer walkOneStep, walkTwoStep, walkThreeStep, jump, musicOne, musicTwo, noises, coinSound, monsterSoundScore;
boolean start, rStart, hStart, bought2000, bought4000, changeDeer, startBackground, changeCastle, changeOriginal, shopPageTwo, shopPageOne,
norseBackground;

Buttons button;
Noises newNoise;
Bat bat;
Knife knife;
Rorscharch rorscharch;
Shop theShop;
KnifeBox boxKnife;
Help help;


void setup() {
  size(1000, 300);
  shopPageOne = true;
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
  deerBackground = loadImage("deerBackground.jpg");
  castleBackground = loadImage("castleBackground.jpg");
  norseBackgroundChange = loadImage("norseBackground.jpg");
  myScore = new Score();
  playerOne = new Player();
  newChest = new Chest();
  state = 0;
  spotlightSize = 200;
  block = new ArrayList<Block>();
  block.add(new Block());
  button = new Buttons();
  bat = new Bat();
  rorscharch = new Rorscharch();
  theShop = new Shop();
  boxKnife = new KnifeBox();
  help = new Help();
}

void draw() {
  menuScreen.menuScreenStart();
  if (start == true)     
    menuScreen.startGame();
  if (rStart == true) {
    theShop.buyTest();
  }
  if (hStart == true) {
    help.displayHelp();
  }
}
void keyPressed() {
  button.buttonsToPress();
}
void collisionDetection() {
}