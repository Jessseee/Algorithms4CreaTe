PVector ballPos;
PVector ballVel;

int ballSize =50;

PVector grav = new PVector(0,-.01*ballSize);;

float friction = 1;

long prevTime;

void setup() {
  size(1000,2000);
  ballPos = new PVector(-width/2+100,parabola(-width/2+100));
  ballVel = new PVector(0,0);
}

void draw() {
  long curTime = millis();
  float dt = (curTime - prevTime)/1000f;
  prevTime = curTime;
  float time = curTime/1000f;
  
  background(200);
  scale(1,-1);
  translate(width/2, -height);
  
  //draw parabola
  for(int i = -width/2; i < width/2; i++) {
    strokeWeight(2);
    point(i,parabola(i));
  }
  
  //calculate forces
  PVector gravForce = grav.copy().mult(ballPos.y);
  PVector tempNormal = parabolaNormal(ballPos.x);
  float angle = PVector.angleBetween(tempNormal.copy().rotate(-PI),gravForce);
  PVector normal = tempNormal.mult(cos(angle)*gravForce.mag()).mult(1);
  //PVector normal = new PVector(
  println(normal.mag());
  
  PVector total = new PVector().add(gravForce).add(normal);
  
  //calculate velocity
  ballVel.add(total.copy().div(ballSize).mult(1));
  
  //Calculate position
  ballPos.add(ballVel.copy().mult(dt));
  
  //draw forces
  
  line(ballPos.x,ballPos.y,ballPos.x+gravForce.x,ballPos.y+gravForce.y);
  line(ballPos.x,ballPos.y,ballPos.x+normal.x,ballPos.y+normal.y);
  line(ballPos.x,ballPos.y,ballPos.x+total.x,ballPos.y+total.y);
  
  //simple ball move
  //ballPos.x++;
  //ballPos.y = parabola(ballPos.x);
  //ballPos.x = reverseParabola(ballPos.y);
  
  //ballPos.x = cos(time*sqrt((1/225)*9.81));
  //ballPos.y = 0.5*(pow(cos(time*sqrt((1/225)*9.81)),2))+1000;
  
  //draw ball
  ellipse(ballPos.x,ballPos.y, ballSize, ballSize);
  
}

float parabola(float x) {
  return pow(x,2)/225+1000;
}

PVector parabolaNormal(float x) {
  return new PVector(1,2f/225f*x).rotate(HALF_PI).normalize();
}

PVector dParabola(float x) {
  return new PVector(1,2f/225f*x).normalize();
}

float reverseParabola(float y) {
  return sqrt(225*y-1000);
}
