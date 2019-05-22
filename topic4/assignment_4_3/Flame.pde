class Flame {
  PVector anchor, top, left, right;

  int noiseOffset, noiseInf;

  float flameHeight, flameWidth;
  
  color col;

  Flame(PVector anchor, float flameHeight, float flameWidth, color col, int noiseOffset, int noiseInf, int horOffset) {
    this.flameHeight = flameHeight;
    this.flameWidth = flameHeight;
    
    this.col = col;
    
    this.noiseOffset = noiseOffset;
    this.noiseInf = noiseInf;

    this.anchor = anchor;
    top = new PVector(anchor.x+horOffset, height-flameHeight);

    left = new PVector(anchor.x-flameWidth+horOffset/3, height-flameHeight/4+flameWidth);
    right = new PVector(anchor.x+flameWidth+horOffset/3, height-flameHeight/4+flameWidth);
  }

  void display() {

    PVector cTop = top.copy();
    cTop.x += noiseInf*noise(time+2*noiseOffset)*2-1*noiseInf;
    cTop.y += noiseInf*noise(time+3*noiseOffset)*2-1*noiseInf;
    PVector cLeft = left.copy();
    cLeft.x -= 2*noiseInf*noise(time+4*noiseOffset);
    cLeft.y += 2*noiseInf*noise(time+5*noiseOffset)*2-2*noiseInf;
    PVector cRight = right.copy();
    cRight.x += 2*noiseInf*noise(time+6*noiseOffset);
    cRight.y += 2*noiseInf*noise(time+7*noiseOffset)*2-2*noiseInf;


    //level influence
    float level = song.right.level();
    println(level);
    float levelInf = level*flameHeight;

    cTop.y-=levelInf;
    cLeft.x-=levelInf;
    cRight.x+=levelInf;


    beginShape();
    strokeWeight(0);
    stroke(col);
    fill(col);
    vertex(anchor.x, anchor.y);
    bezierVertex(anchor.x, anchor.y, cLeft.x, cLeft.y, cTop.x, cTop.y);
    bezierVertex(cTop.x, cTop.y, cRight.x, cRight.y, anchor.x, anchor.y);
    endShape();
  }
}
