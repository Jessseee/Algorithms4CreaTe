void setup() {
  size(100,100);
  textSize(20);
  int x=0;
  int y=0;
  String sats[] = new String[] {"sat1","sat2","sat3","sat4","sat5","sat6","sat7","sat8","sat9"};
  for(int i=0;i<sats.length;i++) {
    for(int j=i+1;j<sats.length;j++) {
      for(int k=j+1;k<sats.length;k++) {
        for(int l=k+1;l<sats.length;l++) {
          println(sats[i]+sats[j]+sats[k]+sats[l]);
        }
      }
    }
  }
}