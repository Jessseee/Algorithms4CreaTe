// class to organise the handling of rooms and transitions

class RoomStateMachine {
  // map room object to the name of the roomState
  Map<RoomState, Room> rooms;
  Room currentRoom;
  
  RoomStateMachine(Map<RoomState, Room> rooms, RoomState initRoom) {
    // copy mapping of rooms
    this.rooms = new HashMap<RoomState, Room>(rooms);
    changeRoom(initRoom);
  }
  
  void changeRoom(RoomState nextRoom) {
    currentRoom = rooms.get(nextRoom);
    currentRoom.enterRoom();
  }

  void doAvailableTransitions() {
    while (currentRoom.hasNextRoom()) changeRoom(currentRoom.getNextRoom());
  }

  void drawRoom() {
    background(255);
    currentRoom.display();
    currentRoom.changeRoom();
  }

  void handleMousePress(float x, float y, Inventory inventory) {
    currentRoom.handleMousePress(x, y, inventory);
  }
}
