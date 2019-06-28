// class to display and keep track of the player's inventory

class Inventory {
  ArrayList<String> items;
  float x, y;
  boolean isDisplayed;

  Inventory() {
    items = new ArrayList<String>();
    x = width/9;
    y = height/10;
  }

  void display() {
    if (isDisplayed) {
      fill(255);
      rectMode(CORNER);
      textSize(10);
      rect(x-40, y-20, width/8, 25+20*items.size());
      fill(0);
      textAlign(LEFT, CENTER);
      text("Inventory :", x-25, y-10);
      if (items.size() == 0) text("empty", x+30, y-10); 
      else for (int i = 0; i < items.size(); i++) text("• " + items.get(i), x-20, 30+y+20*(i-1));
      textAlign(CENTER, CENTER);
      rectMode(CENTER);
    }
  }
  
  void addItem(String item) {
    message = new Message("you found: " + item, 1000, width/2, height/2);
    items.add(item);
  }

  void removeItem(String item) {
    items.remove(item);
  }

  boolean hasItem(String item) {
    return items.contains(item);
  }

  void toggleDisplay() {
    isDisplayed = ! isDisplayed;
  }
}
