// returns the sum of all multiples of 3 and 5 below 1000. multiple of 3 and 5 at the same time are not counted twice.
void setup() {
  int sum = 0;
  for(int i = 0; i < ceil(1000/3);i++) {
    int curNum = 3*i;
    if(curNum % 5 == 0) continue;
    sum+=3*i;
  }
  for(int i = 0; i < ceil(1000/5);i++) {
    sum+=5*i;
  }
  println(sum);
  exit();
}
