boolean sound;
import processing.sound.*;
int frq = 1;
SinOsc sinWave;
//
// sinWave.play();
//
// sinWave.stop();

int BUBBLE = 0;
int SELECTION = 1;
int INSERTION = 2;

int RANDOM = 0;
int ASCENDING = 1;
int DESCENDING = 2;

int NUM_VALUES = 20;
int dataSize;
int maxValue;
int mode;
sortArray sorty;

boolean liveSort;

void setup() {
  size (600, 400);
  background(0);
  textSize(25);
  sinWave = new SinOsc(this);
  dataSize = NUM_VALUES;
  mode = RANDOM;
  maxValue = max(300, dataSize);
  sorty = new sortArray(BUBBLE, dataSize, maxValue, mode);
}//setup

void draw() {
  background(0);
  sorty.display(true);
  if (liveSort) {
    sorty.sortOnce();
  }
  frq = sorty.getPosValue();
  sinWave.freq(frq + 200);
}//draw


void keyPressed() {
  if (key == 'r') {
    reset();
  }//reset
  if (key == ' ') {
    liveSort = !liveSort;
  }
  if (keyCode == RIGHT) {
    sorty.sortOnce();
  }
  if (keyCode == UP) {
    sorty.resize(20);
  }
  if (keyCode == DOWN) {
    sorty.resize(-20);
  }
  if (key == 'b') {
    sorty.bubbleSort();
  }
  if (key == 's') {
    sorty.selectionSort();
  }
  if (key == 'i') {
    sorty.insertionSort();
  }
  if (key == '1') {
    sorty.algorithm = BUBBLE;
    reset();
  }
  if (key == '2') {
    sorty.algorithm = SELECTION;
    reset();
  }
  if (key == '3') {
    sorty.algorithm = INSERTION;
    reset();
  }
  if (key == 'a') {
    mode = ASCENDING;
    reset();
  }
  if (key == 'd') {
    mode = DESCENDING;
    reset();
  }
  if (key == 'q') {
    mode = RANDOM;
    reset();
  }
  if (key == 'm') {
    sound = !sound;
    if (sound) {
      sinWave.play();
    }
    else {
      sinWave.stop();
    }
  }
}//keyPressed

void reset() {
  sorty.randInts(mode);
  sorty.resetSortVars();
}//reset for more sorting
