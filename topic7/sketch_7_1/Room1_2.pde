// each of these subclasses of Room
// defines one state of the statemachine

class Room1_2 extends Room {
  String roomName;

  // initialize this particular room
  Room1_2(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    // initialize this room's furniture
    furniture.add(new Furniture(width-width/6, ground, width/4, height/6, "bed", null, true));
    furniture.add(new Furniture(width/2, ground, width/8, width/8, "dresser", "key", false));
  }
}
