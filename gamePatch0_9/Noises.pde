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
    if (playRain == true) {
      if (playerOne.counter == 1) {
        noises.play();
        norseSong.pause();
      }
      if (playerOne.counter == 0) {
        noises.rewind();
      }
      if (playerOne.counter == 1499) {
        musicTwo.rewind();
      }
      if (playerOne.counter == 1500) {
        musicTwo.play();
      }
      if (playerOne.counter == 999) {
        musicOne.rewind();
      }
      if (playerOne.counter == 1000) {
        musicOne.play();
      }
    }
    if (playNorse == true){
     norseSong.play();
    }
  }
}