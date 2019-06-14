// each of these subclasses of Room
// defines one state of the statemachine

class Room2_1 extends Room {  
  String roomName;

  // initialize this particular room
  Room2_1(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    // initialize this room's furniture
    furniture.add(new Furniture(width-width/6, ground, width/4, height/6, "bed", null, true));
    furniture.add(new Furniture(width/4, ground-height/8, width/8, height/2, "wardrobe", null, true));
    furniture.add(new Furniture(width-width/2.5, ground+height/23, width/8, height/6, "dresser", null, false));
  }
}
