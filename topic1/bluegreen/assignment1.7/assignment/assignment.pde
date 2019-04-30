void setup() {
  size(200,200);
  for(int i=0;i<2;i++) {
    for(int j=0;j<2;j++) {
      for(int k=0;k<2;k++) {
        String bin = str(i)+str(j)+str(k);
        int num = (i*4+j*2+k);
        text("Binary: "+bin+" Number: "+num,0,10+10*num);
      }
    }
  }
}
