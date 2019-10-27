class Player {
  float playerX = width-200;
  float moveY;
  float playerY = 700;
  float playerSpeed=10;
  boolean movement=true;

  void display() {        //Draws the player
    fill(#6c5ce7);
    strokeWeight(5);
    stroke(0);
    line(playerX, playerY, playerX-20, playerY+60);   // Venstre ben
    line(playerX, playerY, playerX+20, playerY+60);   // Højre ben
    line(playerX, playerY, playerX-60, playerY-30);   // Venstre arm
    line(playerX, playerY, playerX+60, playerY-30);   // Højre arm
    noStroke();
    ellipse(playerX, playerY, 60, 60);    //Belly
    ellipse(playerX, playerY-45, 30, 30); //Head
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {                  //if Up is pressed
        playerY=playerY-playerSpeed;        //Moves the player up
      } else if (keyCode == DOWN) {         //if down is pressed
        playerY=playerY+playerSpeed;        //Moves the player down
      }
    }
  }

  void border() {              //stops the player from moving outside the window
    if (playerY<60) {          //Top
      playerY=60;
    }
    if (playerY>height-60) {   // Buttom
      println("stop"); 
      playerY=height-60;
    }
  }
}
