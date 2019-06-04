Flock flock;

void setup() {
  fullScreen();
  flock = new Flock();
  for (int i = 0; i < 50; i++) {
    Vehicle vehicle = new Vehicle(width/2+random(-i, i), height/2+random(-i, i), 5);
    flock.addVehicle(vehicle);
  }
}

void draw() {
  background(0);
  flock.move();
}
