Grass[][] grasses;

long prevTime;
long interval = 500;

int grassWidth = 40;
int grassHeight = 200;

float forceModifier = 0.05;

float noiseOffset = 10;
float noiseTimeOffset = 0;
float noiseOffsetter = 0.1;

void setup() {
  size(1000, 1000);
  grasses = new Grass[width/grassWidth][height/grassHeight];
  for (int i = 0; i < grasses.length; i++) {
    for (int j = 0; j < grasses[0].length; j++) {
      grasses[i][j] = new Grass(new PVector(i*grassWidth, (j+1)*grassHeight), 3, grassHeight, grassWidth);
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < grasses.length; i++) {
    for (int j = 0; j < grasses[0].length; j++) {
      grasses[i][j].update();
      grasses[i][j].display();
    }
  }

  long currentTime = millis();
  if (currentTime-prevTime > interval) {

    for (int i = 0; i < grasses.length; i++) {
      for (int j = 0; j < grasses[0].length; j++) {
        grasses[i][j].addForce(noise(i+noiseOffset+noiseOffset, j+noiseOffset+noiseTimeOffset)*2*forceModifier-forceModifier);
      }
    }
    prevTime = currentTime;
    noiseTimeOffset+=noiseOffsetter;
  }
}
