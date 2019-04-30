//decides wheter letters from an array form a palindrome.
import java.util.Arrays;

char[] chars;

void setup() {
  size(100,100);
  chars = new char[] {'a','n','n','a'};
  
  for(int i = 0; i < chars.length; i++) print(chars[i]);
  print(Arrays.equals(chars,reverse(chars)) ? " is":" is not");
  print(" a palindrome");
  exit();
}
