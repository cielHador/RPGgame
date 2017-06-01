class Knife {
  int speed;
  float x, y, w, h;
  PImage knifeDisplay;


  Knife() {
    x = width/2;
    y = height-40/2;
    w = 20;
    h = 10;
    speed = 5;
    knifeDisplay = loadImage("knife.png");
  }

  void displayKnife() {
    image(knifeDisplay, x-50, y-50);
    x = x + speed;
  }
  void handleKnifeButton() {
  }

  void throwKnife() {
    if (boxKnife.knifeCount >= 1) {
      x = width/2;
      y = playerOne.yPos-10;
      boxKnife.knifeCount = boxKnife.knifeCount - 1;
    }
  }
}