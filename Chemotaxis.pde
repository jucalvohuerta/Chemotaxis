Bacterie[] colonie;

void setup() {
  size(500, 500);
  colonie = new Bacterie[1000];
  for (int i = 0; i < colonie.length; i++)
    colonie[i] = new Bacterie((int)(sqrt(62500-(int)(Math.random()*70)*(int)(Math.random()*70))), (int)(sqrt(50000-(int)(Math.random()*70)*(int)(Math.random()*70))));
  //(250 + (int)(Math.random()*300) -150 ,250 + (int)(Math.random()*300) -150);
  //((int)(Math.random()*250), (int)(Math.random()*250));
}

void draw() {
  background(200);
  for (int i = 0; i < colonie.length; i++) {
    colonie[i].show();
    colonie[i].move();
    if (dist(colonie[i].myX, colonie[i].myY, mouseX, mouseY) < 15) {
      colonie[i].alive = false;
    }
  }
} 

class Bacterie {
  int myX, myY, couleur, mySize;
  boolean alive;
  Bacterie(int x, int y) {
    myX = x;
    myY = y;
    alive = true;
    couleur = 0;
    mySize = 15;
  }

  void move() {
    myX += (int)(Math.random()*12-6);
    myY += (int)(Math.random()*12-6);

    //      println(myX, myY);
  }
  void show() {
    if (alive == true) {
      stroke(5);
      strokeWeight(1);
      fill(120 + couleur, 155 + (int)(couleur/2), 180);
      ellipse(myX, myY, mySize, mySize);
      mousePressed();
    }
  }
  void mousePressed() {
    if (mousePressed == true)
      couleur = (int)(Math.random()*100-50);
    else {
      return;
    }
  }
}
