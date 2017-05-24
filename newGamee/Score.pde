class Score {
  int theScore;
  int highscore;

  Score() {
    theScore = 0;
    JSONObject savedHighScore = loadJSONObject("data/highscore.json");
    highscore = savedHighScore.getInt("highscore");
  }

  void addPoints() {
    theScore = playerOne.counter; 
    checkIfNewHighscore();
    if (theScore == 2000) {
      block.add(new Block());
      monsterSoundScore.play();
    }

    if (theScore == 3000) {
      monsterSoundScore.rewind();
      monsterSoundScore.play();
      block.add(new Block());
    }
    if (theScore == 4000) {
      monsterSoundScore.rewind();
      monsterSoundScore.play();
      block.add(new Block());
    }
  }

  void checkIfNewHighscore() {
    if (theScore > highscore) {
      highscore = theScore;
      saveNewHighscore();
    }
  }

  void display() {
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
  }

  void displayTopScore() {
    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    text("Current highscore!", width/2, height/3-20);
    text(highscore, width/2, height/3);
  }

  void saveNewHighscore() {
    JSONObject savedHighScore = new JSONObject();
    savedHighScore.setInt("highscore", theScore);
    saveJSONObject(savedHighScore, "data/highscore.json");
  }
  void stopTheScore() {
    theScore = theScore + 0;
    //println(theScore);
  }
}