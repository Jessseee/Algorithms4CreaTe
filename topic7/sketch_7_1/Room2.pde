// each of these subclasses of Room
// defines one state of the statemachine

class Room2 extends Room {  
  String roomName;

  // initialize this particular room
  Room2(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    furniture.add(new Furniture(width/2, ground, width/5, height/5, "dresser", "dog treats", false)); // initialize this room's furniture
  }
}
