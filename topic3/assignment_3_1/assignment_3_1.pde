Ball ball;

PVector grav;

// Initialize new ball object and gravity
void setup() {
  fullScreen();
  background(0);
  ball = new Ball(1.5, new PVector(0, height/4), new PVector(0, 0), new PVector(0, 0));
  grav = new PVector(0, 0.2);
  // Apply initial force
  ball.applyForce(new PVector(5, -10));
}

// Display/move ball object and apply gravity
void draw() {
  ball.display();
  ball.update();
  ball.applyForce(grav);
}
