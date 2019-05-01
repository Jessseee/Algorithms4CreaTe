// calculates and returns all prime factors of a given number. In this case 317584931803.
void setup() {
  long num = 317584931803L;
  
  FloatList factors = new FloatList();
  for (long i=2; i<ceil(sqrt(num)); i++) {
    if (num%i == 0) {
      boolean prime = true;
      for (long k=2; k<ceil(sqrt(i)); k++) {
        if (i%k == 0) {
          prime=false;
          break;
        }
      }
      if (prime) factors.push(i);
    }
  }
  println(factors);
  exit();
}
