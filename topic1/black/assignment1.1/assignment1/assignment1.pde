char[] chars;

void setup() {
  size(100,100);
  chars = new char[] {'b','e','d'};
  
  int x = 0;
  for (char letter : chars) {
    text(letter,x,10);
    x+=10;
  }
}
