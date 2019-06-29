// class to store and update vector flow field

class Flowfield {
  PVector[] vectors;
  float zoff, xinc, yinc, zinc;

  Flowfield() {
    vectors = new PVector[GRID_WIDTH * GRID_HEIGHT];
    zoff = 0;
    xinc = yinc = 0.1;
    zinc = 0.01;
  }
  
  // loop trough all cells and assign a new 3D Perlin noise value
  void update() {
    float yoff = 0;
    for (int y = 0; y < GRID_HEIGHT; y++) {
      float xoff = 0;
      for (int x = 0; x < GRID_WIDTH; x++) {
        int index = x + y * GRID_WIDTH;
        float r = noise(xoff, yoff, zoff) * TWO_PI;
        xoff += xinc;  
        PVector v = PVector.fromAngle(r);
        v.setMag(0.01);
        vectors[index] = v;
      }
      yoff += yinc;
    }
    zoff += zinc;
  }
  
  // retrieves a vector from a cell in the flow field
  PVector getVector(int index) {
    return vectors[index];
  }
  
  // display the vectors in each cell as a line
  void display() {
    for (int y = 0; y < GRID_HEIGHT; y++) { 
      for (int x = 0; x < GRID_WIDTH; x++) {
        int index = x + y * GRID_WIDTH;
        PVector v = vectors[index];
        stroke(255);
        strokeWeight(0.1);
        pushMatrix();
        translate(x * CELL_SIZE, y * CELL_SIZE);
        rotate(v.heading());
        line(0, 0, CELL_SIZE, 0);
        popMatrix();
      }
    }
  }
  
  // reseed the perlin noise array with a random seed
  void reset() {
    noiseSeed((long)random(1000));
  }
}
