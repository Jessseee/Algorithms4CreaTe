/* Flame class to display and move the flame 
 * on the hand of the noise sign and music
 */

class Flame {
  PVector anchor, top, left, right;
  float flameHeight, flameWidth;
  color col;

  int noiseOffset = 10;
  int noiseInf = 150;

  // Instantiate Flame class
  Flame(PVector anchor, float flameHeight, float flameWidth, color col) {
    this.flameHeight = flameHeight;
    this.flameWidth = flameHeight;
    this.col = col;
    this.anchor = anchor;

    top = new PVector(anchor.x, height-flameHeight);
    left = new PVector(anchor.x-flameWidth, height-flameHeight/3+flameWidth);
    right = new PVector(anchor.x+flameWidth, height-flameHeight/3+flameWidth);
  }

  // Display and move flame on the hand of noise
  void display() {
    // move the bezier handles using noise
    PVector cTop = top.copy();
    cTop.x += noiseInf*noise(time+2*noiseOffset)*2-1*noiseInf;
    cTop.y += noiseInf*noise(time+3*noiseOffset)*2-1;
    PVector cLeft = left.copy();
    cLeft.x -= 2*noiseInf*noise(time+4*noiseOffset);
    cLeft.y += 2*noiseInf*noise(time+5*noiseOffset)*2-2*noiseInf;
    PVector cRight = right.copy();
    cRight.x += 2*noiseInf*noise(time+6*noiseOffset);
    cRight.y += 2*noiseInf*noise(time+7*noiseOffset)*2-2*noiseInf;

    // Influence the shape of the flame using the music level
    float level = song.right.level();
    float levelInf = level*flameHeight;
    
    cTop.y -= levelInf;
    cLeft.x -= levelInf;
    cRight.x += levelInf;
    
    // Draw flame bezier to the screen
    strokeWeight(0);
    fill(col);
    beginShape();
      vertex(anchor.x, anchor.y);
      bezierVertex(anchor.x, anchor.y, cLeft.x, cLeft.y, cTop.x, cTop.y);
      bezierVertex(cTop.x, cTop.y, cRight.x, cRight.y, anchor.x, anchor.y);
    endShape();
  }
}
