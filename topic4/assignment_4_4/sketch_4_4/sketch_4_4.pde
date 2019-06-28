/* Comparing two particle systems that differ only in the implementation of the
 * particles as an Array or ArrayList.
 *
 * The performance of both particle systems is very similar. Which system is better
 * depends on if the amount of particles used is known before hand. The only performance
 * issue with ArrayList is when there is no capacity set it will copy the whole array
 * every time it grows larger in total size. This can be seen the first time the particles
 * are spawned as the frame rate might drop a little. This can be fixed by setting the
 * initial capacity of the ArrayList.
 * 
 * by Jonathan Matarazzi & Jesse Visser.
 */

ArrayListSystem arrayListSystem;
ArraySystem arraySystem;
int state;

void setup() {
  size(900, 900);
  state = 0;
  arrayListSystem = new ArrayListSystem(new PVector(width/4, height/2));
  arraySystem = new ArraySystem(new PVector(3*width/4, height/2));
}

// draw either or both particle systems
void draw() {
  background(255);
  switch(state) {
  case 0 :
    arrayListSystem.run();
    arraySystem.run();
    break;

  case 1 :
    arrayListSystem.run();
    break;

  case 2:
    arraySystem.run();
    break;
  }
}

// change which particle system is displayed
void mousePressed() {
  arrayListSystem = new ArrayListSystem(new PVector(width/4, height/2));
  arraySystem = new ArraySystem(new PVector(3*width/4, height/2));
  if (state < 2) {
    state++;
  } else {
    state = 0;
  }
}
