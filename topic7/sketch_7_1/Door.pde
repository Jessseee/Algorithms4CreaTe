// This class handles display and interactions of doors

class Door {
  float x, y, w, h;
  boolean isOpen, isLocked;

  Door(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.w = size/2;
    this.h = size;
    this.isOpen = false;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (isOpen) {
      fill(80);
      rect(0, 0, w, h);
      fill(255);
      beginShape();
      vertex(-w/2, -h/2);
      vertex(w/2.2, -h/2.2);
      vertex(w/2.2, h/1.8);
      vertex(-w/2, h/2);
      endShape(CLOSE);
      ellipse(w/4.2, h/20, w/10.5, h/20);
    } else {
      fill(255);
      rect(0, 0, w, h);
      if (isLocked) {
        rect(w/4, h/25, w/15, h/20);
        ellipse(w/4, 0, w/10, h/20);
      } else {
        ellipse(w/4, 0, w/10, h/20);
      }
    }
    popMatrix();
  }

  void toggleLock() {
    isLocked = !isLocked;
  }

  void pressed(float x, float y) {
    if ((this.x - w/2 < x) && (x < this.x + w/2) && (this.y - h/2 < y) && (y < this.y + h/2)) {
      if (!isLocked) isOpen = !isOpen;
      else if (inventory.hasItem("key")) {
        message = new Message("the door is unlocked!", 1000, width/2, height/2);
        inventory.removeItem("key");
        isLocked = false;
      } else message = new Message("this door is locked", 1000, width/2, height/2);
    }
  }
}
