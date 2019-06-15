// all possible rooms
enum RoomState {
  ROOM_START, 
  ROOM_1, 
  ROOM_1_1, 
  ROOM_1_2, 
  ROOM_1_3, 
  ROOM_2, 
  ROOM_2_1, 
  ROOM_2_2, 
  ROOM_2_3, 
  ROOM_END
}

/* Room Hierarchy:
           ┏━ 1.1
        1 ━╋━ 1.2
        ┃  ┗━ 1.3
 START ━┫
        ┃  ┏━ 2.1
        2 ━┫
           ┗━ 2.2 ━ END
 */
