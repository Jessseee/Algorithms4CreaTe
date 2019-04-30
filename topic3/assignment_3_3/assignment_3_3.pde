Ball ball;

PVector grav, vec2ball;
float dist2ball;

float deltaTime = millis();
long prevTime;

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
  
  long curTime = millis();
  deltaTime = (curTime - prevTime)/10f;
  prevTime = curTime;
  println(deltaTime);
  
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
    ball.update(deltaTime);
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
