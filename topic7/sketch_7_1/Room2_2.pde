// each of these subclasses of Room
// defines one state of the statemachine

class Room2_2 extends Room {  
  String roomName;

  // initialize this particular room
  Room2_2(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    furniture.add(new Furniture(width/4, ground+height/15, width/10, height/8, "sidetable", null, false)); // initialize this room's furniture
    doors[0].toggleLock(); // lock the door to the next room
  }
}
