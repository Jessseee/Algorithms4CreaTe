Ball ball;

PVector grav;

// Initialize new ball object and gravity
void setup() {
  fullScreen();
  ball = new Ball(1.5, new PVector(0, height/4), new PVector(0, 0), new PVector(5, -10));
  grav = new PVector(0, 0.4);
  // Apply initial force
}

// Display/move ball object and apply gravity
void draw() {
  background(50);
  ball.display();
  ball.update();
  ball.applyForce(grav);
}
