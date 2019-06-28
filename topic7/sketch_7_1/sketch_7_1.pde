/* This is a basic point and click game based on a finite state machine.
 * Uses a finite state machine to guide the player trough a series of hotel rooms.
 * Where they can interact with a multitute of objects to find a way into a mysterious locked room.
 * by Jesse Visser and Jonathan Matarazzi
 */

import java.util.*;

RoomStateMachine stateMachine;
Message message;
Inventory inventory;

void setup() {
  size(900, 500);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  // map every room to a roomstate to be able to easely change between rooms.
  Map<RoomState, Room> rooms = new HashMap<RoomState, Room>();

  // the following sets up the structure of the state machine
  // it matches the names of the roomStates to the corresponding room
  // then defines the rooms that come before and after
  // and lastly it defines the name of the room
  rooms.put(RoomState.ROOM_START, new RoomStart(new RoomState[] {RoomState.ROOM_1, RoomState.ROOM_2}, null, "Lobby"));
  rooms.put(RoomState.ROOM_1, new Room1(new RoomState[] {RoomState.ROOM_1_1, RoomState.ROOM_1_2, RoomState.ROOM_1_3}, RoomState.ROOM_START, "Left Wing"));
  rooms.put(RoomState.ROOM_1_1, new Room1_1(new RoomState[] {}, RoomState.ROOM_1, "Room 1"));
  rooms.put(RoomState.ROOM_1_2, new Room1_2(new RoomState[] {}, RoomState.ROOM_1, "Room 2"));
  rooms.put(RoomState.ROOM_1_3, new Room1_3(new RoomState[] {}, RoomState.ROOM_1, "Room 3"));
  rooms.put(RoomState.ROOM_2, new Room2(new RoomState[] {RoomState.ROOM_2_1, RoomState.ROOM_2_2}, RoomState.ROOM_START, "Right Wing"));
  rooms.put(RoomState.ROOM_2_1, new Room2_1(new RoomState[] {}, RoomState.ROOM_2, "Room 4"));
  rooms.put(RoomState.ROOM_2_2, new Room2_2(new RoomState[] {RoomState.ROOM_END}, RoomState.ROOM_2, "Room 5"));
  rooms.put(RoomState.ROOM_END, new RoomEnd(new RoomState[] {}, RoomState.ROOM_2_2, "Mysterious Room"));

  stateMachine = new RoomStateMachine(rooms, RoomState.ROOM_START);
  message = new Message("press space to open inventory", 1500, width/2, height/2);
  inventory = new Inventory();
}

// display the room, message and inventory
void draw() {
  stateMachine.doAvailableTransitions();
  stateMachine.drawRoom();
  message.display();
  inventory.display();
}

void mousePressed() {
  stateMachine.handleMousePress(mouseX, mouseY, inventory);
}

// toggle the display of the inventory when spacebar is pressed
void keyPressed() {
  if (key == ' ') inventory.toggleDisplay();
}
