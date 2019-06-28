class Flowfield {
  PVector[] vectors;
  float zoff, xinc, yinc, zinc;

  Flowfield() {
    vectors = new PVector[GRID_WIDTH * GRID_HEIGHT];
    zoff = 0;
    xinc = yinc = 0.1;
    zinc = 0.001;
  }

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
  
  PVector getVector(int index) {
    return vectors[index];
  }
}
