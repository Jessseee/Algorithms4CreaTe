/* A physics accurate stack of rotary mass spring damper systems.
 * By Jesse Visser & Jonathan Matarazzi
 */

System system;

void setup() {
  //Create a system consisting of 10 msd systems
  system = new System(10);
  size(1000,1000);
}

void draw() {
  background(255);
  //Update and draw the system
  system.update();
  system.display();
}
