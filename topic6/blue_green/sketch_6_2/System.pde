//A class that manages multiple mass spring damper systems.
class System {
  ArrayList<RotMSDSystem> subSystems;

  System(int parts) {
    subSystems = new ArrayList<RotMSDSystem>();
    //create the individual mass sprig dampers systems
    for (int i = 0; i< parts; i++) {
      subSystems.add(new RotMSDSystem((height/2-20)/parts, PI/parts, parts));
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
    //display all individual mass spring damper systems
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI);
    for (RotMSDSystem subSystem : subSystems) {
      subSystem.display();
    }
    popMatrix();
  }
}
