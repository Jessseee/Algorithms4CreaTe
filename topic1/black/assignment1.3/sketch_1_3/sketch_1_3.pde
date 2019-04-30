int[] numbers;

void setup() {  
  // initialize numbers array with random numbers between 0 and 100
  numbers = new int[500];
  for (int i = 0; i < numbers.length; i++) {
    numbers[i] = (int) random(100);
  }
  // print which integers are above 50
  println(count(numbers));
}

// counts integers above 50 in array
int count(int[] array) {
  int j = 0;
  for (int i = 0; i < array.length; i++) {
    if(array[i] > 50) {
      j++;
    }
  }
  return j;
}
