class Noises {
  int state;
  int timer;
  int timeRainIsOn;
  int timeElapsed;

  Noises() {
    state = 0;
    timer = 0;
    timeRainIsOn  = 30360000;
  }


  void startNoisesAndEnd() {
    if (playerOne.counter == 0) {
      noises.play();
    }
    if (playerOne.counter == 30360000){
     noises.play(); 
    }
  }
}