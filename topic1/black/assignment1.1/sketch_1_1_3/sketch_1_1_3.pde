// counts the occurences of the letter 'e' in an array.
char[] chars;

void setup() {
  size(100,100);
  background(0);
  textAlign(CENTER);
  textSize(20);
  chars = new char[] {'b','e','d'};
  
  int amount = 0;
  for (char letter : chars) {
    if (letter == 'e') {
      amount++;
    }
  }
  println(amount);
  exit();
}
