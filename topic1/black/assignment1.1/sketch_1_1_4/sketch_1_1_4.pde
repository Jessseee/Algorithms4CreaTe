import java.util.Arrays;

char[] chars;

void setup() {
  size(100,100);
  chars = new char[] {'a','n','n','a'};
  
  text((Arrays.equals(chars,reverse(chars)) ? "True":"False"),0,10);
}
