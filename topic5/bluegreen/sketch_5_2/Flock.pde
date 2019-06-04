class Flock {
  ArrayList<Vehicle> vehicles;

  Flock() {
    vehicles = new ArrayList<Vehicle>();
  }

  void move() {
    for (Vehicle vehicle : vehicles) {
      vehicle.move();
      seperate(vehicle, vehicles);
      align(vehicle, vehicles);
      cohere(vehicle, vehicles);
    }
  }

  void seperate(Vehicle vehicle, ArrayList<Vehicle> others) {
    float desiredSeperation = 25;
    PVector steer = new PVector(0, 0);
    int count = 0;

    for (Vehicle other : others) {
      float d = PVector.dist(vehicle.pos, other.pos);
      if ((d > 0) && (d < desiredSeperation)) {
        PVector diff = PVector.sub(vehicle.pos, other.pos);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }

    if (count > 0) {
      steer.div((float)count);
      steer.normalize();
      steer.mult(vehicle.maxSpeed);
      steer.sub(vehicle.vel);
      steer.limit(vehicle.maxForce);
    }

    vehicle.applyForce(steer);
  }

  void align(Vehicle vehicle, ArrayList<Vehicle> others) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(vehicle.pos, other.pos);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.pos);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      PVector steer = vehicle.limitForce(sum);
      vehicle.applyForce(steer);
    }
  }

  void cohere(Vehicle vehicle, ArrayList<Vehicle> others) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(vehicle.pos, other.pos);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.pos);
      }
    }
    if(count > 0) {
      sum.div(count);
      vehicle.applyForce(vehicle.seek(sum));
    }
  }

  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
  }
}
