/*
 * Does a couple of manipulations to an array of charachters.
 */
import java.util.Arrays;

char[] chars;

void setup() {
  size(100, 100);
  background(0);
  chars = new char[] {'a', 'n', 'n', 'a'};
}

void draw() {
  showChars(chars, 5, 20);
  showReverseChars(chars, 5, 40);
  text("Amount of 'a': "+amount(chars, 'a'), 5, 60);
  text("It is " + (palindrome(chars) ? "":"not ") + "palindrome.", 5, 80);
}

// writes the content of an array to the processing window, letter by letter.
void showChars(char[] chars, int x, int y) {
  for (char letter : chars) {
    text(letter, x, y);
    x+=10;
  }
}

// writes the content of an array to the Processing window, in backwards order.
void showReverseChars(char[] chars, int x, int y) {
  for (char letter : reverse(chars)) {
    text(letter, x, y);
    x+=10;
  }
}

// counts the occurences of the letter 'a' an array.
int amount(char[] chars, char checkChar) {
  int amount = 0;
  for (char letter : chars) {
    if (letter == checkChar) {
      amount++;
    }
  }
  return amount;
}

//decides wheter letters from an array form a palindrome.
boolean palindrome(char[] chars) {
  return (Arrays.equals(chars, reverse(chars)));
}
