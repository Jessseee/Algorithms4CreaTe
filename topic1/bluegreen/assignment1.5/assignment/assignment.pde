void setup() {
  size(200,200);
  int sum = 0;
  for(int i = 0; i < ceil(1000/3);i++) {
    int curNum = 3*i;
    if(curNum % 5 == 0) continue;
    sum+=3*i;
  }
  for(int i = 0; i < ceil(1000/5);i++) {
    sum+=5*i;
  }
  text(sum,0,10);
}
