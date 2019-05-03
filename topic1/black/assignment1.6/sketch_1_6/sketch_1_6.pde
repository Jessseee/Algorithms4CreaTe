/*
 * Transforms binary number represented as a string into its decimal representation.
 */
String bin;
char[] spltBin;
int j = 0;

void setup() {
  bin = "110101";
  // split string into array of characters.
  spltBin = bin.toCharArray();
  // confert binary abcdef into decimal with the function ((((a*2)+b)*2+c)*2+d)*2+e)*2+f).
  for (int i = 0; i < spltBin.length; i++) {
    j *= 2;
    j += int(str(spltBin[i]));
  }
  println(j);
  exit();
}
