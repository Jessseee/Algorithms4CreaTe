// based on The Coding Train coding challenge #11 and processing noise reference.

int w, h, scl, cols, rows;
float dY;
float[][] grid;

void setup() {
  size(900, 600, P3D);
  w = width;
  h = height;
  scl = 35;
  cols = w/scl;
  rows = h/scl;
  grid = new float[cols][rows];
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  noFill();
  textAlign(CENTER);
  textSize(20);
  
  text("click for new terrain", width/2, 80);
  
  // translate the terrain to be visible in the viewport
  pushMatrix();
  translate(w/2, h/2);
  rotateX(PI/3);
  translate(-w/2, -h/3);
  
  // loop through perlin noise
  dY -= .08;
  float yoff = dY;
  
  // set the height for every vertex in the 2d array
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      grid[x][y] = map(noise(xoff, yoff), 0, 1, -150, 200);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, grid[x][y]);
        vertex(x*scl, (y+1)*scl, grid[x][y+1]);
      endShape();
    }
  }
  popMatrix();
}

void mousePressed() {
  reset();
}

void reset() {
  text("loading...", width/2, 100);
  noiseSeed((int) random(100));
  grid = new float[cols][rows];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      grid[x][y] = map(noise(xoff, yoff), 0, 1, -100, 150);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
}
