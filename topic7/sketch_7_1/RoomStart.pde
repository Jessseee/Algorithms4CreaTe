// each of these subclasses of Room
// defines one state of the statemachine

class RoomStart extends Room {  
  String roomName;

  // initialize this particular room
  RoomStart(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    // initialize this room's furniture
    furniture.add(new Furniture(width/2, ground, width/4, width/4, "desk", null, false));
  }
}
