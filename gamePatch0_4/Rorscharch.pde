class Rorscharch {
  int slideNumber;
  PImage slideOne, slideTwo, slideThree, slideFour, slideFive, slideSix, slideSeven, slideEight, slideNine, slideTen;

  Rorscharch() {
    slideNumber = 0;
    slideOne = loadImage("I1.jpg");
    slideTwo = loadImage("I2.jpg");
    slideThree = loadImage("I3.jpg");
  }

  void startTest() {
  }

  void buttonAnswers() {
  }

  void oneAnswer() {
    if (slideNumber == 0) {
      text("An army or navy emblem", width/2, height/2);
      image(slideOne,width/2,height/2);
    }
  }
  void twoAnswer() {
  }
  void threeAnswer() {
  }
  void fourAnswer() {
  } 
  void fiveAnswer() {
  }
  void sixAnswer() {
  }
  void sevenAnswer() {
  }
  void eightAnswer() {
  }
  void nineAnswer() {
  }
  void tenAnswer() {
  }
  void elevenAnswer() {
  }
}