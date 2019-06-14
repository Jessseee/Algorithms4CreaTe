class ReturnArrow {
  float x, y, w, h;
  boolean isPressed;

  ReturnArrow(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.w = size;
    this.h = size;
    this.isPressed = false;
  }

  void display() {
    pushMatrix();
    fill(0);
    beginShape();
    vertex(x, y+h/2);
    vertex(x+w/2, y);
    vertex(x+w/6, y);
    vertex(x+w/6, y-h/2);
    vertex(x-w/6, y-h/2);
    vertex(x-w/6, y);
    vertex(x-w/2, y);
    endShape(CLOSE);
    popMatrix();
  }

  void pressed(float x, float y) {
    if ((this.x - w/2 < x) && (x < this.x + w/2) && (this.y - h/2 < y) && (y < this.y + h/2)) {
      isPressed = !isPressed;
    }
  }
}
