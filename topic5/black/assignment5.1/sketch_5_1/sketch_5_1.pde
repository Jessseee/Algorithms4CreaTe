/* Based on an example by The Nature of Code
 * An algorithm for flocking behaviour.
 * Writen by Daniel Shiffman
 * Build upon by Jesse Visser & Jonathan Matarazzi
 */
 
Flock flock;
 
void setup() {
  fullScreen();
  flock = new Flock();
  for(int i = 0; i < 200; i++) {
    Vehicle vehicle = new Vehicle(width/2, height/2);
    flock.addVehicle(vehicle);
  }
}

void draw() {
  background(0);
  flock.move();
}
