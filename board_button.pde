class BoardButton {
  float x, y, w, h;
  int bg, pressed_bg;
  boolean is_pressed = false;
  String audio;

  BoardButton() {

  }

  void show() {
    noStroke();
    color current_bg = (is_pressed)  ? pressed_bg : bg;
    fill(current_bg);
    rect(x, y, w, h);
    media_player.load_track(audio);
    media_player.play();
    is_pressed = false;
  }

  void set_as_pressed() {
    is_pressed = true;
  }

  void set_as_unpressed() {
    is_pressed = false;
  }

  boolean has_been_pressed() {
    boolean pressedX = (mouseX >= x && mouseX <= (x + w));
    boolean pressedY = (mouseY >= y && mouseY <= (y + h));
    return pressedX && pressedY;
  }
}
