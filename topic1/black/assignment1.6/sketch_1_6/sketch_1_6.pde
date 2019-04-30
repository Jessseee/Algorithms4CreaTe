String bin;
char[] spltBin;
int j = 0;

void setup() {
  bin = "110101";
  spltBin = bin.toCharArray();
  for (int i = 0; i < spltBin.length; i++) {
    j *= 2;
    j += int(str(spltBin[i]));
  }
  println(j);
}
