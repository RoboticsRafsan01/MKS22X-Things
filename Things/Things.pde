PImage rock;
PShape alien,top,bottom;
PShape ralien, rhead, rbody;
interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  float h,w;
  Rock(float x, float y) {
    super(x, y);
    h = 20+random(30);
    w = 20+random(30);

  }

  void display() {
    /* ONE PERSON WRITE THIS */
    //fill(0,0,255);
    //image(rock,x,y,w,h);
    fill(0,0,255);
    
    // Create the shape group
    ralien = createShape(GROUP);

    // Make two shapes
    ellipseMode(CORNER);
    rhead = createShape(RECT, x, y, w, h);
    rhead.setFill(color(0,0,255));
    rbody = createShape(TRIANGLE, x+20, y+20, x+10, y-20,x-20,y-20);
    rbody.setFill(color(0,90,0));

    // Add the two "child" shapes to the parent group
    ralien.addChild(rbody);
    ralien.addChild(rhead);
    
    rbody = createShape(ELLIPSE, x, y, 50.0, 50.0);
    rbody.setFill(color(0,0,255));
    
    ralien.addChild(rbody);
    
    shape(ralien);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    /* ONE PERSON WRITE THIS */
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {
    super(x, y);
    size = 60;
    dx = 1;
    dy = 1;
  }
  int size;
  int dx;
  int dy = 1;
  void display() {
    fill(255,0,0);
    ellipse(x,y,size,size);
  }

  void move() {
    if (x <= size/2 || x > width - size/2){
      dx*=-1;
    }
    else if (y <= size/2 || y > height - size/2){
      dy*=-1;
    }
    x+=dx;
    y+=dy;
  }
}

class Person extends Thing implements Moveable {
 Person(float x, float y){
    super(x,y);
    alien = createShape(GROUP);
    dy = 1;
    dx = 1;
    X = (int)x;
    Y = (int)y;
    //top = ellipse(X, Y, 50, 50);
    //top.setFill(color(255));
    //bottom = createShape(RECT, X, Y, 50, 40);
    //bottom.setFill(color(0));
    //alien.addChild(top);
    //alien.addChild(bottom);
 }
 int dx,dy,size,X,Y;
 void move(){
   if (X <= size/2 || X > width - size/2){
      dx*=-1;
    }
    else if (Y <= size/2 || Y > height - size/2){
      dy*=-1;
    }
    X+=dx;
    Y+=dy;
 }
 
 void display(){
   fill(color(255));
   ellipse(X,Y,50,50);
   fill(color(0));
   rect(X,Y-18,50,40);
   fill(color(200));
   rect(X+30,Y-18,40,10);
   fill(color(200));
   rect(X+30,Y+12,40,10);
 }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
    Person p = new Person(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(p);
    thingsToMove.add(p);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
  rock = loadImage("rock.jpg");
}
void draw() {
  background(255);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
