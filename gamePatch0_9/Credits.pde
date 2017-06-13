class Credits {

  Credits() {
  }

  void displayCredits() {
    if (creditsScreen == true) {
      background(menuScreenStart);
      text("Developer - Cocidus McAvoy", width/2, 40);
      text("Images - Vivisaurs", width/2, 60);
      text("Audio - SoundBible.com", width/2, 80);
      text("~Beta Testers~", width/2, 100);
      text("Mikaila D.", width/2, 120);
      text("Ryan L.", width/2, 140);
      text("Miranda M.", width/2, 160);
      text("BioSmiley", width/2, 180);
      text("Ashton P.", width/2, 200);
      text("Elite169", width/2, 220);
      text("Max Z.", width/2, 240);
      text("Yuqi W.", width/2, 260);
      fill(0);
      rectMode(CENTER);
      rect(width/2, height-15/2, 200, 20, 7);
      fill(255);
      text("Press s to leave credits", width/2, height-20/2);
    }
  }
}