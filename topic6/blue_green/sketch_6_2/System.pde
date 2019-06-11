class System {
  ArrayList<RotMSDSystem> subSystems;

  System(int parts) {
    subSystems = new ArrayList<RotMSDSystem>();
    for (int i = 0; i< parts; i++) {
      subSystems.add(new RotMSDSystem((height/2-20)/parts, HALF_PI/parts, parts));
    }
  }

  void update() {
    subSystems.get(0).update(subSystems.get(1).getVel(), 0);
    for (int i = 1; i < subSystems.size()-1; i++) {
      subSystems.get(i).update(subSystems.get(i+1).getVel(), subSystems.get(i-1).getForce());
    }
    subSystems.get(subSystems.size()-1).update(0, subSystems.get(subSystems.size()-2).getForce());
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI);
    for (RotMSDSystem subSystem : subSystems) {
      subSystem.display();
    }
    popMatrix();
  }
}
