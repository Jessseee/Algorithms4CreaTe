class Grass {
  ArrayList<RotMSDSystem> subSystems;
  PVector pos;
  float grassWidth;
  

  Grass(PVector position, int parts, float grassHeight, float grassWidth) {
    this.pos = position;
    this.grassWidth = grassWidth;
    subSystems = new ArrayList<RotMSDSystem>();
    float widthModifier = grassWidth/parts;
    for (int i = 0; i< parts; i++) {
      float lowerWidth = grassWidth-i*widthModifier;
      float higherWidth = grassWidth-(i+1)*widthModifier;
      subSystems.add(new RotMSDSystem(grassHeight/parts, PI/parts, parts, lowerWidth, higherWidth));
    }
  }

  void update() {
    subSystems.get(0).update(0, subSystems.get(1).getForce());
    for (int i = 1; i < subSystems.size()-1; i++) {
      subSystems.get(i).update(subSystems.get(i-1).getVel(), subSystems.get(i+1).getForce());
    }
    subSystems.get(subSystems.size()-1).update(subSystems.get(subSystems.size()-2).getVel(), 0);
  }

  void display() {
    strokeWeight(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PI);
    for (RotMSDSystem subSystem : subSystems) {
      subSystem.display();
    }
    popMatrix();
  }
  
  void addForce(float force) {
    subSystems.get(subSystems.size()-1).addForce(force);
  }
}
