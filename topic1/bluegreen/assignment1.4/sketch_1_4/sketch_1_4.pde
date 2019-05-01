// returns the sum of all multiples of 5 below 1000.
void setup() {
  int sum = 0;
  int num = 0;
  while(true) {
    if(num >= 1000-5) break;
    sum += num += 5;
  }
  println(sum);
  exit();
}
