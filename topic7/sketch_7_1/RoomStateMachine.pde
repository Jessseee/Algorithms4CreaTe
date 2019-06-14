class RoomStateMachine {
  Map<RoomState, Room> rooms;
  Room currentRoom;

  RoomStateMachine(Map<RoomState, Room> rooms, RoomState initRoom) {
    this.rooms = new HashMap<RoomState, Room>(rooms);

    changeRoom(initRoom);
  }

  void changeRoom(RoomState nextRoom) {
    currentRoom = rooms.get(nextRoom);
    currentRoom.enterRoom();
  }

  void doAvailableTransitions() {
    while (currentRoom.hasNextRoom()) {
      changeRoom(currentRoom.getNextRoom());
    }
  }

  void drawRoom() {
    background(255);
    currentRoom.display();
    currentRoom.update();
  }

  void handleMousePress(float x, float y) {
    currentRoom.handleMousePress(x, y);
  }
}
