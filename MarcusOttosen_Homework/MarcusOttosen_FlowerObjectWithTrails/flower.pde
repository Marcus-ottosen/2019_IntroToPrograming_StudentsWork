class Flower {

  float r;//radius of flower
  float petalX; 
  float petalY;
  float x; //flower center x
  float y; //flower center y
  float petal=0;//number of petals
  float xSpeed;//flower moving speed x
  float ySpeed;//flower moving speed y

  float[] trailX = new float[num];
  float[] trailY = new float[num];

  Flower(
    float tempR, /*define size of flower*/ 
    float tempSpeedX, /*define speed on x axis*/ 
    float tempSpeedY /*define speed on y axis*/) {
    x = 0;
    y = 0;
    r = tempR;
    petal = 7;
    xSpeed=tempSpeedX;
    ySpeed=tempSpeedY;
  }

  Flower(
    float tempR, /*define size of flower*/ 
    float tempP /*define number of petals*/
    ) {
    x = width;
    y = height-100;
    r = tempR;
    petal = tempP;
    xSpeed=10;
    ySpeed=5;
  }

  void display() {
    // Trails. Credit: https://processing.org/tutorials/arrays/
    // Edited to follow flowers
    fill(200, 102);
    // Shift the values to the right in the array
    for (int i = num-1; i > 0; i--) {
      trailX[i] = trailX[i-1];
      trailY[i] = trailY[i-1];
    }
    // Add the new values to the beginning of the array
    trailX[0] = x;
    trailY[0] = y;
    // Draw the circles
    for (int i = 0; i < num; i++) {
      ellipse(trailX[i], trailY[i], i/1.0, i/1.0);
    }

    // Flower petals
    fill(#F9FC36);
    for (float i=0; i<PI*2; i+=2*PI/petal) { //flower petals surrounding flower
      petalX=r*cos(i);
      petalY=r*sin(i);
      ellipse(x+petalX, y+petalY, r, r);
    }
    //Center of the flower
    fill(#F55745);
    ellipse(x, y, r*1.2, r*1.2);

    //Makes the balls bounce off the wall
    x = x+xSpeed; 
    if (x>width || x<0) {
      xSpeed = xSpeed* -1;
    }
    y = y+ySpeed;
    if (y>height || y<0) {
      ySpeed = ySpeed* -1;
    }
  }

  boolean overlaps(Flower OtherFlower) {
    if (dist (x, y, OtherFlower.x, OtherFlower.y)<(2.2*r+OtherFlower.r))
    {
      return true;
    } else
    {  
      return false;
    }
  }
}
