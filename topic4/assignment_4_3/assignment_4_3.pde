import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;

float time = 0;
float dt = 0.08;

int flamesAmount = 10;
int noiseInf = 150;
int flameOffset = 100;

ArrayList<Flame> flames;

void setup() {
  fullScreen();
  //size(1000,1000);

  minim = new Minim(this);
  song = minim.loadFile("fire.mp3");
  song.play();

  flames = new ArrayList<Flame>();

  for (int i = 0; i< flamesAmount; i++) {
    flames.add(new Flame(new PVector(width/2, height-height/80), height/1.2-flameOffset*abs(flamesAmount/2-i), height/6, color(255, 50, 0, 100), 10*i, noiseInf, flameOffset*i-flameOffset*flamesAmount/2));
  }
  for (int i = 0; i< flamesAmount; i++) {
    flames.add(new Flame(new PVector(width/2, height-height/80), height/1.5-flameOffset*abs(flamesAmount/2-i), height/10, color(255, 50, 0), 10*i, noiseInf, flameOffset*i-flameOffset*flamesAmount/2));
  }
  for (int i = 0; i< flamesAmount; i++) {
    flames.add(new Flame(new PVector(width/2, height-height/80), height/2-flameOffset*abs(flamesAmount/2-i), height/20, color(255, 200, 0), 10*i, noiseInf, flameOffset*i-flameOffset*flamesAmount/2));
  }
}

void draw() {
  background(0);
  strokeWeight(0);

  for (Flame flame : flames) {
    flame.display();
  }

  time+=dt;
}
