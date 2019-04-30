void setup() {
  size(200,200);
  int sum = 0;
  int num = 0;
  while(true) {
    if(num >= 1000-5) break;
    sum += num += 5;
  }
  text(sum,0,10);
}
