Car [] cars = new Car[2];    //Creates an array of Car
Player myPlayer;
boolean hit=false;
int score;
int highscore;
int temp_score;
int R = 255; 
int G = 249; 
int B = 240;

void setup() {
  size (1000, 1000);
  //myCar = new Car();
  for (int i = 0; i < cars.length; i++) {   // Creates 2 cars
    cars[i] = new Car();
  }
  myPlayer= new Player();
}

void draw() {
  background(R, G, B);      //255,249,240
  if (!hit) {
    myPlayer.display();     //Displays the player
    myPlayer.keyPressed();  //Moves the player when pressing keys
    myPlayer.border();      //stops the player from moving outside the window

    for (int i = 0; i < cars.length; i++) {

      cars[i].display();        //displays the car
      cars[i].respawn();        //respawns the car every time it drives outside the window
      cars[i].carHit();
    }
  }

  fill(0);                 //color of score text
  textSize(20);            //Size of score text
  text(score, 30, 30);     //Displays score

  //if (dist (myCar.carX, myCar.carY, myPlayer.playerX, myPlayer.playerY)<110) {  //checks if they collide
  //  hit=true;
  //}
  if (dist(cars[0].carX, cars[0].carY, cars[1].carX, cars[1].carY)<110 && cars[0].carX < -80 ) {      //Makes sure the cars dont spawn at the same place
    cars[0].carY=random(50, (height-50));    // Changes the CarY if they do spawn at the same place
  }

  if (score > highscore) {
    highscore=score;
  }

  if (hit) {                    //When the car and the player collides
    background(#e17055);    //changes the background to red
    textSize(100);              //Text stuff begin
    fill(255);
    text("YOU LOST!", width/4, height/4);
    textSize(20);
    text("Press SPACE to play again!", width/4, height/4+50);
    text("Score: " + score, width/4, height/4+70);
    text("Your Highscore: " + highscore, width/4, height/4+90); //text stuff stop
    R=255;
    G=249;
    B=240;
    if (keyPressed) {        //Press SPACE to restart
      if (key == ' ') {
        hit = false;
        score=0;            //resets the score to restart
        for (int i = 0; i < cars.length; i++) {
          cars[i].carX=random(-350, -100);    //resets the X position of the car
          cars[i].carY=random(50, (height-50));    //Randomizes the carY position
        }
      }
    }
  }
}
