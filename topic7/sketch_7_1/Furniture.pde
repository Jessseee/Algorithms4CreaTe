// class to handle display and interactions of furniture

class Furniture {
  float x, y, w, h;
  String furniture, item;
  boolean isOpen, isMirrored;

  Furniture(float x, float y, float w, float h, String furniture, String item, boolean isMirrored) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.furniture = furniture;
    this.isMirrored = isMirrored;
    this.item = item;
  }

  void display() {
    pushMatrix();
    fill(255);
    translate(x, y);
    if (isMirrored) scale(-1, 1); // mirror furniture

    // switch structure to choose which piece of furniture is displayed
    switch(furniture) {
    case "desk" :
      rect(0, 0, w, h/2);
      rect(0, 0, w/2, h/4);
      fill(0);
      textSize(height/20);
      text("HOTEL", 0, 0);
      fill(255);
      beginShape();
        vertex(-w/2, -h/4);
        vertex(-w/2.1, -h/2.8);
        vertex(w/2.1, -h/2.8);
        vertex(w/2, -h/4);
      endShape();
      break;

    case "sidetable" :
      strokeWeight(3);
      line(0, -h/2, 0, -h);
      line(0, -h/2, 0, h/10);
      line(0, -h/2, w/3, 0);
      line(0, -h/2, -w/3, 0);
      strokeWeight(1);
      ellipse(0, -h, w, h/4);
      break;

    case "dresser" :
      rect(0, 0, w, h);
      if (isOpen) {
        rect(0, 0, w-w/10, h/3.4);
        rect(0, 0, w/5, h/20);
        rect(0, h/3.1, w-w/10, h/3.4);
        rect(0, h/3.1, w/5, h/20);
        rect(0, -h/6, w-w/10, h/3.4);
        rect(0, -h/6, w/5, h/20);
        beginShape();
          vertex(w/2-w/20, -h/3.1);
          vertex(w/2-w/15, -h/2.2);
          vertex(-w/2+w/15, -h/2.2);
          vertex(-w/2+w/20, -h/3.1);
        endShape();
      } else {
        rect(0, -h/3.1, w-w/10, h/3.4);
        rect(0, -h/3.1, w/5, h/20);
        rect(0, 0, w-w/10, h/3.4);
        rect(0, 0, w/5, h/20);
        rect(0, h/3.1, w-w/10, h/3.4);
        rect(0, h/3.1, w/5, h/20);
      }
      beginShape();
        vertex(-w/2, -h/2);
        vertex(-w/2.1, -h/1.3);
        vertex(w/2.1, -h/1.3);
        vertex(w/2, -h/2);
      endShape();
      break;

    case "table" :
      beginShape();
        vertex(-w/2.2, -h/4);
        vertex(w/2.3, -h/4);
        vertex(w/2, h/2);
        vertex(-w/2, h/2);
      endShape(CLOSE);
      beginShape();
        vertex(-w/2, h/2+h/5);
        vertex(-w/2, h/2+h/2.5);
        vertex(-w/2+w/12, h/2+h/2.5);
        vertex(-w/2+w/12, h/2+h/5);
        vertex(-w/2+w/10, h/2+h/5);
        vertex(-w/2+w/12, h/2+h/2.5);
      endShape();
      beginShape();
        vertex(w/2, h/2+h/5);
        vertex(w/2, h/2+h/2.5);
        vertex(w/2-w/12, h/2+h/2.5);
        vertex(w/2-w/12, h/2+h/5);
        vertex(w/2-w/10, h/2+h/5);
        vertex(w/2-w/12, h/2+h/2.5);
      endShape();
      rect(0, h/1.7, w, h/5);
      break;

    case "bed" :
      beginShape();
        vertex(-w/2+w/12, h/2+h/2.5);
        vertex(-w/2.4, -h/1.5);
        vertex(-w/2.8, -h);
        vertex(-w/2.3, -h);
        vertex(-w/2, -h/1.5);
        vertex(-w/2, h/2+h/2.5);
        vertex(-w/2+w/12, h/2+h/2.5);
      endShape();
      beginShape();
        vertex(-w/2+w/12, h/2+h/2.5);
        vertex(-w/2.8, 0);
        vertex(-w/2.8, -h);
        vertex(-w/2.4, -h/1.5);
        vertex(-w/2+w/12, h/2+h/2.5);
        vertex(-w/2.4, -h/1.5);
        vertex(-w/2, -h/1.5);
      endShape();
      beginShape();
        vertex(w/2, h/2+h/5);
        vertex(w/2, h/2+h/2.5);
        vertex(w/2-w/12, h/2+h/2.5);
        vertex(w/2-w/12, h/2+h/5);
        vertex(w/2-w/10, h/2+h/5);
        vertex(w/2-w/12, h/2+h/2.5);
      endShape();
      beginShape();
        vertex(w/2, h/2-h/4);
        vertex(w/2.3, -h/4);
        vertex(-w/2.8, -h/4);
        vertex(-w/2+w/12, h/2-h/4);
        vertex(w/2, h/2-h/4);
        vertex(w/2, h/2);
        vertex(-w/2+w/12, h/2);
        vertex(-w/2+w/12, h/2-h/4);
      endShape();
      rect(0, h/1.7, w, h/5);
      break;

    case "wardrobe" :
      rect(0, 0, w, h);
      if (isOpen) {
        rect(0, 0, w/1.1, h/1.05);
        beginShape();
          vertex(-w/2.2, -h/2.1);
          vertex(w/2.3, -h/2.2);
          vertex(w/2.3, h/1.95);
          vertex(-w/2.2, h/2.1);
        endShape(CLOSE);
        ellipse(w/4, h/50, w/11, w/10);
      } else {
        rect(0, 0, w/1.1, h/1.05);
        ellipse(w/4, 0, w/10, w/10);
      }
      beginShape();
        vertex(-w/2, -h/2);
        vertex(-w/2.1, -h/1.8);
        vertex(w/2.1, -h/1.8);
        vertex(w/2, -h/2);
      endShape();
      break;
    }
    popMatrix();
  }

  void pressed(float x, float y, Inventory inventory) {
    if ((this.x - w/2 < x) && (x < this.x + w/2) && (this.y - h/2 < y) && (y < this.y + h/2)) {
      isOpen = !isOpen;
      if (item != null) {
        inventory.addItem(item);
        item = null;
      }
    }
  }
}
