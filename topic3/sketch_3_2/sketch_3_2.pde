/* lets a user shoot a ball with the speed depending on the mouse distance to the ball.
 * the ball bounces on the edges of the screen and can be shot again by pressing the left mouse button.
 * by Jesse Visser & Jonathan Matarazzi
 */
Ball ball;

PVector grav;
PVector vec2ball;
float dist2ball;

void setup() {
  fullScreen();
  textSize(20);
  // Initialize new ball object and gravity
  ball = new Ball(1.5, new PVector(width/4, height/2), new PVector(0, 0), new PVector(0, 0));
  grav = new PVector(0, 0.9);
}

// Display and move ball object
void draw() {
  background(0);
  
  // Hold ball in place till shot
  if(ball.shot == false) {
    // Status text
    textAlign(CENTER);
    text("click to shoot", ball.pos.x, ball.pos.y - 40);
    // Calculate vector and distance from mouse to ball.
    vec2ball = new PVector(ball.pos.x-mouseX, ball.pos.y-mouseY);
    dist2ball = vec2ball.mag();
    // Draw line with dot at the end in oposite direction but the same length as vec2ball
    line(ball.pos.x, ball.pos.y, ball.pos.x + vec2ball.x, ball.pos.y + vec2ball.y);
    ellipse(ball.pos.x + vec2ball.x, ball.pos.y + vec2ball.y, 5, 5);
  } 
  else {
    // Status text
    textAlign(RIGHT);
    text("click again to stop", width-50, 50);
    // Move the ball and apply gravity
    ball.update();
    ball.applyForce(grav);
  }
  ball.display();
}

void mousePressed() {
  if(ball.shot == false) {
    // Apply initial force equal to 1/10 the magnitude of vec2ball
    ball.applyForce(vec2ball.div(10));
    ball.shot = true;
  } 
  else {
    // Reset the ball
    ball.shot = false;
    ball.reset();
  }
}
