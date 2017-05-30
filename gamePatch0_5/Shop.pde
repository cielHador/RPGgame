class Shop {
  int purchase;

  Shop() {
    purchase = -5;
  }

  void buyTest() {
    if (rStart == true) {
      background(menuScreenStart);
      text("Current coin count!", width/2, CENTER+10);
      text(newChest.coin, width/2, CENTER+30);
      text("SPEED TO 2000 [ 1 COIN(S) PRESS ',' TO PURCHASE]", width/2, CENTER+60);
    }
  }
  void speedTo2000() {
    newChest.coin = newChest.coin - 1; 
    start = true;
    rStart = false;
    playerOne.counter = 2000;
    playerOne.gravity = 0.2;
  }
}