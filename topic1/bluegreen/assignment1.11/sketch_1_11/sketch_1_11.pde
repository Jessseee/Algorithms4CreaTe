/*
 * Spawns pandas at random positions on the screen with random velocities in random directions that bounce off of eachother.
 * To create visual interest the colours of the panda's ears change depending on their position. It is also possible to 
 * click the screen to spawn a new array of pandas.
 */
Panda[] pandas;
int pandaCount;

void setup() {
  fullScreen();
  pandaCount = 50;
  pandas = new Panda[pandaCount];
  for (int i = 0; i < pandas.length; i++) {
   pandas[i] = new Panda(new PVector(random(100, width-100), random(100, height-100)), new PVector(random(-2, 2), random(-2, 2)), random(50, 100));
  }
}

void draw() {
  background(255);
  for (Panda panda : pandas) {
    panda.display();
    panda.update();
    panda.checkWallCollision();
    for (Panda otherPanda : pandas) {
      if (otherPanda != panda) {
        panda.checkPandaCollision(otherPanda);
      }
    }
  }
}

void mousePressed() {
  reset();
}

void reset() {
  pandas = new Panda[pandaCount];
  for (int i = 0; i < pandas.length; i++) {
   pandas[i] = new Panda(new PVector(random(100, width-100), random(100, height-100)), new PVector(random(-2, 2), random(-2, 2)), random(50, 100));
  }
}
