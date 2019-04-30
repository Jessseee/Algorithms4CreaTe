// writes the content of an array to the Processing window, in backwards order.
char[] chars;

void setup() {
  size(100,100);
  background(0);
  textAlign(CENTER);
  chars = new char[] {'b','e','d'};
  
  int x = 0;
  chars = reverse(chars);
  for (char letter : chars) {
    text(letter,width/2+x,height/2);
    x+=10;
  }
}
