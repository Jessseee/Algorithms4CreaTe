// returns all binary numbers that can be written with 3 bits and their decimal equivalent.
void setup() {
  size(200,200);
  for(int i=0;i<2;i++) {
    for(int j=0;j<2;j++) {
      for(int k=0;k<2;k++) {
        String bin = str(i)+str(j)+str(k);
        int dec = (i*4+j*2+k);
        println("Binary: "+bin+", Decimal: "+dec);
      }
    }
  }
  exit();
}
