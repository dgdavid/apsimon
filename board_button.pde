class BoardButton {
  float x, y, w, h;
  int bg, pressed_bg;

  BoardButton() {

  }

  void show() {
    fill(bg);
    rect(x, y, w, h);
  }
  
  void show_pressed() {
    fill(pressed_bg);
    rect(x, y, w, h);
  }
  
}
