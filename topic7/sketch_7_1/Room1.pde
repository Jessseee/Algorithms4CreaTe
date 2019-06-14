// each of these subclasses of Room
// defines one state of the statemachine

class Room1 extends Room {  
  String roomName;

  // initialize this particular room
  Room1(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    furniture.add(new Furniture(width/3, ground, width/8, width/8, "dresser", "easter egg", false)); // initialize this room's furniture
  }
}
