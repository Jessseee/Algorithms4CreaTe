/* Visualization of a translational mass, spring, damper system
 * By Jesse Visse & Jonathan Matarazzi
 */
 
TransMSDSystem system;

// Create a translational mass, spring, damper object
void setup() {
  system = new TransMSDSystem(0.1, 100, 10, 200);
  size(1000,1000);
}

// Update and display mass, spring, damper object
void draw() {
  background(255);
  system.update();
  system.display();
}
