class Ball {
  int xPos, yPos, size;
  color col;
  Ball(int x, int y, int size) {
    this.xPos = x;
    this.yPos = y;
    this.size = size;
    this.col = color(random(0,255),255,255);
    fill(col);
    ellipse(x,y,size,size);
  }
  
  boolean overlap(int x, int y) {
    return (dist(x,y,xPos,yPos) <= size/2);
  }
  
  int distance(int x, int y) {
    return (int) dist(x,y,xPos,yPos)-size/2;
  }
}
