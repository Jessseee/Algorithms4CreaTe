char[] chars;

void setup() {
  size(100,100);
  chars = new char[] {'b','e','d'};
  
  int amount = 0;
  for (char letter : chars) {
    if (letter == 'e') {
      amount++;
    }
  }
  text(amount,0,10);
}
