/* A flame moving with a combination of Perlin noise 
 * and the song 'I Want It That Way' by the Backstreet Boys
 * Requires minim music library, http://code.compartmental.net/tools/minim/
 * by Jesse Visser and Jonathan Matarazzi
 */

// importing libaries needed for playing and analysing music
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

ArrayList<Flame> flames;

void setup() {
  fullScreen();

  // instantiate music player and starting song
  minim = new Minim(this);
  song = minim.loadFile("fire.mp3");
  song.play();

  flames = new ArrayList<Flame>();

  // instantiate three layers of the flame
  flames.add(new Flame(new PVector(width/2, height-height/80), height/1.2, height/6, color(255, 50, 0, 100)));
  flames.add(new Flame(new PVector(width/2, height-height/80), height/1.5, height/10, color(255, 50, 0)));
  flames.add(new Flame(new PVector(width/2, height-height/80), height/2, height/20, color(255, 200, 0)));
}

// move the flame over time
void draw() {
  background(0);

  for (Flame flame : flames) {
    flame.display();
  }

  time+=dt;
}
