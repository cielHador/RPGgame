class Help {


  PImage helpCharacter, chestPicShow, knifeBoxShow;

  Help() {
    helpCharacter = loadImage("moveGone.png");
    chestPicShow = loadImage("sma_chest_nearest_16x.png");
    knifeBoxShow = loadImage("boxCardBoard.png");
  }
  void displayHelp() {
    if (hStart == true) {
      background(menuScreenStart);
      textSize(20);
      text("Kontroller / Controls", width/2, 40);
      textSize(15);
      text("Hoppe er plass / Space to jump", width/2, 80);
      text("Butikk er o / o for shop", width/2, 100);
      text("Kniv er t / t for knife", width/2, 120);
      text("Stoppe er a / a to pause", width/2, 140);
      text("Start er d / d to start", width/2, 160);
      text("Omstart er s(Også for å avslutte) / s to start(Also to exit here)", width/2, 180);
      text("To collect knives collect the cardboard boxes,", 170, 20);
      knifeBoxShow.resize(40,40);
      image(knifeBoxShow,350,-8);
      chestPicShow.resize(20,20);
      image(chestPicShow,335,24);
      image(helpCharacter,width/2-60,height-62);
      text("to collect coins, collect the chests.", 131.9, 35);
      text("You can use the knives to kill enemies.", 143, 50);
      text("Å samle kniver samle kartongene,", 850, 20);
      text("Å samle mynter, samle kistene.", 841, 35);
      text("Du kan bruke knivene til å drepe fiender", 850, 50);
      fill(0);
      rectMode(CENTER);
      rect(width/2, height-15/2, 200, 20, 7);
      fill(255);
      text("Press s to leave help", width/2, height-20/2);
    }
  }

  void showHelpButton() {
    text("Press i for help", width/2+430, height/2-130);
  }
}