PVector ballPos;
PVector ballVel;
PVector ballAcc;
PVector ballForce;

int ballSize = 50;

float g = 9.81;
float friction = 1;

void setup() {
  size(1000, 1000);
  ballVel = new PVector(0, 0);
  ballPos = new PVector(-width/2+100, parabola(-width/2+100));
}

void draw() {
  translate(width/2, height-100);
  background(200);

  //draw line
  strokeWeight(2);
  for (int i = -width/2; i<width/2; i++) {
    point(i, -parabola(i));
  }

  //Forces
  PVector gravityForce = new PVector(0, -g*ballSize);      //gravity



  float angle = PVector.angleBetween(parabolaDir(ballPos.x), gravityForce);
  //println(angle/(2*PI)*360,parabolaDir(ballPos.x).x,parabolaDir(ballPos.y));
  PVector lineForce = new PVector(cos(angle), sin(angle)).normalize().mult((1-1/abs(cos(angle)))*gravityForce.mag());

  stroke(255,0,0);
  strokeWeight(10);
  line(ballPos.x, -ballPos.y, ballPos.x+lineForce.x, -(ballPos.y+lineForce.y));
  strokeWeight(2);


  PVector frictionForce = new PVector(1, 0).mult(friction * lineForce.mag()/10).rotate(angle);
  
  stroke(0,255,0);
  strokeWeight(10);
  line(ballPos.x, -ballPos.y, ballPos.x+frictionForce.x, -(ballPos.y+frictionForce.y));
  strokeWeight(2);


  ballForce = new PVector(0, 0).add(gravityForce).add(lineForce).sub(frictionForce);

  stroke(0,0,255);
  strokeWeight(10);
  line(ballPos.x, -ballPos.y, ballPos.x+ballForce.x, -(ballPos.y+ballForce.y));
  strokeWeight(2);

  println(ballForce.mag());

  ballAcc = ballForce.copy().mult(1f/ballSize);

  ballVel.add(ballAcc.copy().mult(0.01));

  ballPos.add(ballVel);

  //ballPos.y = parabola(ballPos.x);


  //draw ball
  ellipse(ballPos.x, -ballPos.y, ballSize, ballSize);
}

float parabola(float x) {
  return 5f/height*pow(x, 2);
}

PVector parabolaDir(float x) {
  return new PVector(1, 10f/height*x);
}
