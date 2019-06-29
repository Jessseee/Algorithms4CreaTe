//A class that manages multiple mass spring damper systems and looks like grass
class Grass {
  ArrayList<RotMSDSystem> subSystems;
  PVector pos;
  float grassWidth;
  

  Grass(PVector position, int parts, float grassHeight, float grassWidth) {
    this.pos = position;
    this.grassWidth = grassWidth;
    subSystems = new ArrayList<RotMSDSystem>();
    float widthModifier = grassWidth/parts;
    //create the individual mass sprig dampers systems and calculate the correct width and height for them
    for (int i = 0; i< parts; i++) {
      float lowerWidth = grassWidth-i*widthModifier;
      float higherWidth = grassWidth-(i+1)*widthModifier;
      subSystems.add(new RotMSDSystem(grassHeight/parts, PI/parts, parts, lowerWidth, higherWidth));
    }
  }

  void update() {
    //Update all mass spring damper systems and give them the force and velocity of their neighbours
    subSystems.get(0).update(0, subSystems.get(1).getForce());
    for (int i = 1; i < subSystems.size()-1; i++) {
      subSystems.get(i).update(subSystems.get(i-1).getVel(), subSystems.get(i+1).getForce());
    }
    subSystems.get(subSystems.size()-1).update(subSystems.get(subSystems.size()-2).getVel(), 0);
  }

  void display() {
    //display all individual pieces of grass
    strokeWeight(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PI);
    for (RotMSDSystem subSystem : subSystems) {
      subSystem.display();
    }
    popMatrix();
  }
  
  //Apply a force to the top piece of grass
  void addForce(float force) {
    subSystems.get(subSystems.size()-1).addForce(force);
  }
}
