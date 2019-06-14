// each of these subclasses of Room
// defines one state of the statemachine

class RoomEnd extends Room {  
  String roomName;
  PImage img;

  // initialize this particular room
  RoomEnd (RoomState[] nextRooms, RoomState prevRoom, String roomName) {
    super(nextRooms, prevRoom, roomName); // parce data to parent room class
    img = loadImage("dog.png");
  }

  // display dog and reward text
  void display() {
    super.display();
    imageMode(CENTER);
    // special text for when the player has found the dog treats
    if (inventory.hasItem("dog treats")) {
      message = new Message("the dogs jumps you and steals a dog treat", 1000, width/2, height/3);
    } else {
      message = new Message("you did well, take a doggo", 10, width/2, height/3);
    }
    image(img, width/2-width/25, ground-height/10, width/4, width/4);
  }
}
