Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;

void setup() {
  size(1600, 1200);

  int _r1= 160;
  int _r2 = 100;
  int _r3 = 120;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int offset = 350;


  myFlower1 = new Flower(_r1, _petals, _x, _y, _pc, 2); 
  myFlower2 = new Flower(_r2, _petals, _x+random(-500, 500), _y+offset, _pc, 5);
  myFlower3 = new Flower(_r3, _petals, _x+50, _y-offset, _pc, 7);
}

void draw() {
  background(#43AF76);
  if (myFlower1.overlaps(myFlower3)) {
    background(200);
  }

  myFlower1.display(); //Shows the flower
  myFlower2.display();
  myFlower3.display();
  //myFlower3.coloring();
}
