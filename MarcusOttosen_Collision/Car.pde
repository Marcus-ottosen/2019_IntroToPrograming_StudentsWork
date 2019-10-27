class Car {
  float carX= random(-350, -100);
  float carY = random(50, (height-50));
  float speed=random(8, 11);
  float wheelSize=50;
  float carSize=-5;

  void display() {      //Draws the vehicle
    rectMode(CENTER);
    noStroke();
    fill(#fdcb6e, 100);
    triangle(carX+80, carY, carX+250, carY-35, carX+250, carY+35);            //Lys på bilen

    fill(#00b894);
    rect(carX, carY, (10*20+carSize), (10*6+carSize));                                      //main square
    rect(carX-(10*1+carSize), carY-(5+10*5+carSize), (10*10+carSize), (10*5+carSize));      //Top
    ellipse(carX-(10*7+carSize), carY+(10*3+carSize), wheelSize, wheelSize);                //Wheel 1
    ellipse(carX+(10*7+carSize), carY+(10*3+carSize), wheelSize, wheelSize);                //Wheel 2

    move(); //Runs void move()
  }
  void move() {      //moves the vehicle
    carX=carX+speed;
  }
  void respawn() {          //Respawns the car if it gets outside the window
    if (carX>width+100) {
      carX= random(-350, -100);          //Resets the carX position
      carY=random(50, (height-50));    //Finds a random place on the Y-axis to spawn the car
      score++;                    //increases the score by 1
      speed=speed+0.5;            //Increases the speed of the car every time it respawns
      R=R-int(speed/10);    //Changes the background according to the speed of the car
      G=G-int(speed/10);    //Changes the background according to the speed of the car
      B=B-int(speed/10);    //Changes the background according to the speed of the car
    }
  }

  void carHit() {
    if (dist (carX, carY, myPlayer.playerX, myPlayer.playerY)<110) {  //checks if they collide
      hit=true;
    }
    if (hit) {                    //When the car and the player collides
      speed=random(7, 11);        // resets the speed back to the original speed
    }
  }
}
