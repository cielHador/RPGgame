class Rorscharch {
  int slideNumber;
  PImage slideOne, slideTwo, slideThree, slideFour, slideFive, slideSix, slideSeven, slideEight, slideNine, slideTen;

  Rorscharch() {
    slideNumber = 0;
    slideOne = loadImage("I1.jpg");
    slideTwo = loadImage("I2.jpg");
    slideThree = loadImage("I3.jpg");
    slideFour = loadImage("I4.jpg");
    slideFive = loadImage("I5.jpg");
    slideSix = loadImage("I6.jpg");
    slideSeven = loadImage("I7.jpg");
    slideEight = loadImage("I8.jpg");
    slideNine = loadImage("I9.jpg");
    slideTen = loadImage("I10.jpg");
  }

  void startTest() {
  }

  void buttonAnswers() {
  }

  void oneAnswer() {
    if (slideNumber == 0) {
      slideOne.resize(100, 100);
      image(slideOne, 0, 0);
      image(slideOne, 100, 100);
    }
  }
  void twoAnswer() {
    if (slideNumber == 0) {
      slideTwo.resize(100, 100);
      image(slideTwo, 100, 0);
      image(slideTwo, 0, 100);
    }
  }
  void threeAnswer() {
    if (slideNumber == 0) {
      slideThree.resize(100, 100);
      image(slideThree, 200, 0);
    }
  }
  void fourAnswer() {
    if (slideNumber == 0) {
      slideFour.resize(100, 100);
      image(slideFour, 300, 0);
    }
  } 
  void fiveAnswer() {
    if (slideNumber == 0) {
      slideFive.resize(100, 100);
      image(slideFive, 400, 0);
    }
  }
  void sixAnswer() {
    if (slideNumber == 0) {
      slideSix.resize(100, 100);
      image(slideSix, 500, 0);
    }
  }
  void sevenAnswer() {

    if (slideNumber == 0) {
      slideSeven.resize(100, 100);
      image(slideSeven, 600, 0);
    }
  }
  void eightAnswer() {
    if (slideNumber == 0) {
      slideEight.resize(100, 100);
      image(slideEight, 700, 0);
    }
  }
  void nineAnswer() {
    if (slideNumber == 0) {
      slideNine.resize(100, 100);
      image(slideNine, 800, 0);
    }
  }
  void tenAnswer() {
    if (slideNumber == 0) {
      slideTen.resize(100, 100);
      image(slideTen, 900, 0);
    }
  }
}