import java.util.Arrays;

char[] chars;

void setup() {
  size(100,100);
  chars = new char[] {'a','n','n','a'};
}

void draw() {
  showChars(chars,0,10);
  showReverseChars(chars,0,30);
  text("Amount of 'a': "+amount(chars, 'a'),0,50);
  text("It is " + (palindrome(chars) ? "":"not ") + "palindrome.",0,70);
}

void showChars(char[] chars, int x, int y) {
  for (char letter : chars) {
    text(letter,x,y);
    x+=10;
  }
}

void showReverseChars(char[] chars, int x, int y) {
  for (char letter : reverse(chars)) {
    text(letter,x,y);
    x+=10;
  }
}

int amount(char[] chars, char checkChar) {
  int amount = 0;
  for (char letter : chars) {
    if (letter == checkChar) {
      amount++;
    }
  }
  return amount;
}




boolean palindrome(char[] chars) {
  return (Arrays.equals(chars,reverse(chars)));
}
