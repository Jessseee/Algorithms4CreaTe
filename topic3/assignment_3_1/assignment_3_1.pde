/* Shoots a ball from the left that bounces on the edges of the screen
 * by Jesse Visser & Jonathan Matarazzi
 */
Ball ball;

PVector grav;

// Initialize new ball object and gravity
void setup() {
  fullScreen();
  ball = new Ball(1.5, new PVector(0, height/4), new PVector(0, 0), new PVector(5, -10));
  grav = new PVector(0, 0.4);
}

// Display and move the ball object and apply gravity
void draw() {
  background(50);
  ball.display();
  ball.update();
  ball.applyForce(grav);
}
