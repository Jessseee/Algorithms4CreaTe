Panda[] pandas;

void setup() {
  fullScreen();
  pandas = new Panda[20];
  for (int i = 0; i < pandas.length; i++) {
   pandas[i] = new Panda(new PVector(width/2, height/2), new PVector(random(-3, 3), random(-3, 3)), new PVector(0, 0), random(50, 100));
  }
}

void draw() {
  background(255);
  for (Panda panda : pandas) {
    panda.display();
    panda.update();
  }
}
