Flower f1;
Flower f2;
float speedX;
float speedY;
int num = 50;


void setup() {
  size(800, 600, P2D); // Was a bit laggy, so added P2D

  f1 = new Flower(35, 7);
  speedX=4;
  speedY=4;
  f2 = new Flower(60, speedX, speedY);
}

void draw() {
  //background(#43AF76);
  background(0);
  if (f1.overlaps(f2)) {
    background (50, 50, 200);
  }

  f2.display();
  f1.display();
}
