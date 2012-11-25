class ColoredButton {
  float x, y, w, h;
  int bg, pressed_bg;

  ColoredButton() {

  }

  void show() {
    fill(bg);
    rect(x, y, w, h);
  }
}
