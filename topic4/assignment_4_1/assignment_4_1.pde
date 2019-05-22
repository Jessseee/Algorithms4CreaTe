/* Rocket with particle system
 * By Jesse Visser & Jonathan Matarazzi
 */
 
Rocket rocket;

void setup() {
  size(1000,1000);
  //Create a new Rocket
  rocket = new Rocket(width/2,height, 1, 50);
}

//Update and display the rocket
void draw() {
  background(0);
  rocket.update();
  rocket.display();
}
