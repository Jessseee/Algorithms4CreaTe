class Room {
  RoomState[] nextRooms;
  RoomState nextRoom;
  RoomState prevRoom;
  Door[] doors;
  ReturnArrow arrow;
  ArrayList<Furniture> furniture;
  String roomName;

  float doorSize = width/4;
  float doorY = height/2;
  float ground = doorY + doorSize/2;

  Room(RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    this.nextRooms = nextRooms;
    this.prevRoom = prevRoom;
    furniture = new ArrayList<Furniture>();
    arrow = new ReturnArrow(width/2, height-height/12, width/15);
    doors = new Door[nextRooms.length];
    for (int i = 0; i < doors.length; i++) {
      doors[i] = new Door(width/(doors.length*2) + width/doors.length * i, doorY, doorSize);
    }
    this.roomName = roomName;
    this.reset();
  }

  boolean hasNextRoom() {
    return nextRoom != null;
  }

  RoomState getNextRoom() {
    return nextRoom;
  }

  void enterRoom() {
    this.nextRoom = null; 
    this.reset();
  }

  void returnRoom() {
    this.goToRoom(prevRoom);
  }

  void goToRoom(RoomState nextRoom) {
    this.nextRoom = nextRoom;
  }

  void displayWalls() {
    switch(doors.length) {      
    case 1 : 
      line(100, ground, width-100, ground); 
      line(100, ground, 100, 0); 
      line(width-100, ground, width-100, 0); 
      line(100, ground, 0, height); 
      line(width-100, ground, width, height); 
      break; 
    case 2 : 
      line(20, ground, width, ground); 
      line(20, ground, 0, height); 
      line(20, ground, 20, 0); 
      break; 
    case 3 : 
      line(10, ground, width, ground); 
      line(10, ground, 0, height); 
      line(10, ground, 10, 0); 
      break;
    default :
      line(50, ground, width-50, ground); 
      line(50, ground, 50, 0); 
      line(width-50, ground, width-50, 0); 
      line(50, ground, 0, height); 
      line(width-50, ground, width, height); 
      break;
    }
  }

  void display() {
    displayWalls();
    for (Door door : doors) {
      door.display();
    }
    for (Furniture furniture : furniture) {
      furniture.display();
    }
    fill(0);
    textSize(height/20);
    text(roomName, width/2, height/8);
  }

  void update() {
    for (int i = 0; i < doors.length; i++) {
      if (doors[i].isOpen) {
        goToRoom(nextRooms[i]);
      }
    }
    if (prevRoom != null) {
      arrow.display();
      if (arrow.isPressed) {
        goToRoom(prevRoom);
      }
    }
  }

  void reset() {
    for (Door door : doors) {
      door.isOpen = false;
    }
    arrow.isPressed = false;
  }

  void handleMousePress(float x, float y) {
    for (Door door : doors) {
      door.pressed(x, y);
    }
    for (Furniture furniture : furniture) { 
      furniture.pressed(x, y);
    }
    arrow.pressed(x, y);
  }
}
