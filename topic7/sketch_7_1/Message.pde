// class to display pop up message for a given time

class Message {
  String message;
  float startTime, deltaTime, endTime, x, y;

  Message(String message, float endTime, float x, float y) {
    this.message = message;
    this.endTime = endTime;
    this.x = x;
    this.y = y;
    startTime = millis();
  }

  void display() {
    deltaTime = millis() - startTime;
    if (deltaTime < endTime && message != "") {
      textSize(16);
      fill(255);
      rect(x, y, textWidth(message) + width/20, 50);
      fill(0);
      text(message, x, y);
    } else message = "";
  }
}
