ArrayList<Ball> balls = new ArrayList<Ball>();
int maxSize = 1000;

void setup() {
  //size(400,400);
  fullScreen();
  colorMode(HSB);
}

void draw() {
  int counter = 0;
  while(true){
    boolean overlap = false;
    int x = (int) random(0,width);
    int y = (int) random(0,height);
    int size = x;
    if(y<size) size=y;
    if(height-y<size) size=height-y;
    if(width-x<size) size=width-x;
    
    for(Ball ball : balls) {
      if(ball.overlap(x,y)) {
        overlap = true;
        break;
      }
      int ballDist = ball.distance(x,y)*2;
      if(ballDist<size) size=ballDist;
    }
    counter++;
    if(overlap) continue;
    balls.add(new Ball(x,y,size));
    break;
  }
}
