/* Simulates the roll of a six sided dice 100000 times and returns the distribution of the rolls.
 * Rolls one more dice everytime the processing screen is pressed and prints the new distribution.
 * by Jonathan Matarazzi and Jesse Visser
 */
IntList dice;
int[] occurrence;

void setup() {
  size(100, 100);
  textAlign(CENTER);
  textSize(20);
  //initialize dice array and occurrence array.
  dice = new IntList();
  occurrence = new int[6];
  //insert 1000000 random numbers into the dice array.
  for(int i = 0; i < 1000000; i++) {
    dice.append((int) random(1, 7));
    int number = dice.get(i);
    //count the occurrence of every value in the array.
    occurrence[number-1]++;
  }
  printOccurrence();
}

void draw() {
  fill(0);
  ellipse(width/2, height/2, width-10, height-10);
  fill(255);
  text("roll dice", width/2, height/2+4);
}

//append a new random number to the dice array when the mouse is pressed.
void mousePressed() {
  dice.append((int) random(1, 7));
  occurrence[dice.get(dice.size()-1)-1]++;
  printOccurrence();
  
}

//print the occurrence of every number in the dice array
void printOccurrence() {
  println();
  println("one:",occurrence[0]);
  println("two:",occurrence[1]);
  println("three:",occurrence[2]);
  println("four:",occurrence[3]);
  println("five:",occurrence[4]);
  println("six:",occurrence[5]);
}
