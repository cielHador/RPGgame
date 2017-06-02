class Shop {

  Shop() {
  }

  void buyTest() {
    if (rStart == true) {
      background(menuScreenStart);
      text("Current coin count!", width/2, CENTER+10);
      text(newChest.coin, width/2, CENTER+30);
      text("ADD 2000 TO SCORE [ 1 COIN | PRESS '1' TO PURCHASE ]", width/2, CENTER+60);
      text("ADD 4000 TO SCORE [ 2 COINS | PRESS '2' TO PURCHASE ]", width/2, CENTER+90);
      fill(0);
      rectMode(CENTER);
      rect(width/2, height-15/2, 200, 20, 7);
      fill(255);
      text("Press s to leave shop", width/2, height-20/2);
    }
  }
  void counterPlus2000() {
    newChest.coin = newChest.coin - 1; 
    start = true;
    rStart = false;
    playerOne.counter = playerOne.counter + 2000;
    playerOne.gravity = 0.2;
  }
  
    void counterPlus4000() {
    newChest.coin = newChest.coin - 2; 
    start = true;
    rStart = false;
    playerOne.counter = playerOne.counter + 4000;
    playerOne.gravity = 0.2;
  }
}