/*
 * spawns 20 panda creature at the center of the screen with random velocity vectors in random directions.
 */
Panda[] pandas;

void setup() {
  fullScreen();
  pandas = new Panda[20];
  // Initialize array with random pandas
  for (int i = 0; i < pandas.length; i++) {
   pandas[i] = new Panda(new PVector(width/2, height/2), new PVector(random(-3, 3), random(-3, 3)), random(50, 100));
  }
}

void draw() {
  background(255);
  for (Panda panda : pandas) {
    panda.display();
    panda.update();
  }
}
