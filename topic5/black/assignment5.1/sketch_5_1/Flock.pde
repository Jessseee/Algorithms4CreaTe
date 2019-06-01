class Flock {
  ArrayList<Vehicle> vehicles;
  
  Flock() {
    vehicles = new ArrayList<Vehicle>();
  }
  
  void move() {
    for(Vehicle vehicle : vehicles) {
      vehicle.move(vehicles);
    }
  }
  
  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
  }
}
