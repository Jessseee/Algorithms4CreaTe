/* Flock class contains arraylist of vehicles
 * Moves all vehicles and makes them evade obstacles
 */
 
class Flock {
  ArrayList<Vehicle> vehicles;
  
  // instantiate new flock containing arraylist of vehicles
  Flock() {
    vehicles = new ArrayList<Vehicle>();
  }
  
  // move vehicles in flock and make them evade obstacles
  void move() {
    for(Vehicle vehicle : vehicles) {
      vehicle.move(vehicles);
      vehicle.evadeObstacle(obstacles);
    }
  }
  
  // add vehicles to flock
  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
  }
}
