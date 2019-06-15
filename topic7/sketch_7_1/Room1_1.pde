// each of these subclasses of Room
// defines one state of the statemachine

class Room1_1 extends Room {  
  String roomName;

  // initialize this particular room
  Room1_1(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    // initialize this room's furniture
    furniture.add(new Furniture(width/6, ground, width/4, height/6, "bed", null, false));
    furniture.add(new Furniture(width-width/5, ground-height/6, width/8, height/2, "wardrobe", null, false));
  }
}
