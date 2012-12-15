class VerticalLayout {

  VerticalLayout() {

  }

  void show_tittle() {
    fill(color(255,255,255));
    textSize(50);
    textAlign(CENTER);
    text("APSIMON", width/2, gridY);
  }

  void show_level_info() {
    textSize(15);
    textAlign(LEFT);
    text("LEVEL: " + level, gridX, gridY * 2);
  }

  void show_score_info() {
    textSize(15);
    textAlign(RIGHT);
    text("SCORE: " + score, gridX * 5, gridY * 2);
  }

  void set_layout(Board board, BoardButton buttons[]) {
    size(width, height);
    gridX = width/6;
    gridY = height/8;
    set_board(board, buttons, gridX, gridY);
  }

  void set_board(Board board, BoardButton buttons[], float gridX, float gridY) {
    board = new Board(gridX, gridY * 3, gridX * 4, gridY * 4);
    set_buttons(board, buttons);
  }

  void set_buttons(Board board, BoardButton buttons[]) {

    color colorgreen = color(150,255,150),
          colorred = color(255,150,150),
          coloryellow = color(255,255,150),
          colorblue = color(150,150,255);

    color flashcolorgreen = color(0,255,0),
          flashcolorred = color(255,0,0),
          flashcoloryellow = color(255,255,0),
          flashcolorblue = color(0,0,255);

    color[] buttons_colors = { colorgreen, colorred, coloryellow, colorblue };
    color[] buttons_flash_colors = { flashcolorgreen, flashcolorred, flashcoloryellow, flashcolorblue };

    float[][] buttons_position = {  { board.x, board.y },
                                    { board.width/2 + board.x, board.y },
                                    { board.x, board.height/2 + board.y },
                                    { board.width/2 + board.x, board.height/2 + board.y }  };


    for(int i = 0; i < buttons.length; i++) {
      buttons[i] = new BoardButton();
      buttons[i].x = buttons_position[i][0];
      buttons[i].y = buttons_position[i][1];
      buttons[i].bg = buttons_colors[i];
      buttons[i].pressed_bg = buttons_flash_colors[i];
      buttons[i].w = board.width/2;
      buttons[i].h = board.height/2;
    }
  }

  void show_buttons() {
    for(int i = 0; i < buttons.length; i++) {
      buttons[i].show();
    }
  }

  void show_game_over() {
    background(50);
    fill(color(255, 204, 0));
    textAlign(CENTER, CENTER);
    textSize(25);
    text("You lose in level " + level + " with " + score + " point(s)", width/2, height/2 - 100);
    textSize(50);
    text("GAME OVER :(", width/2, height/2);
    if(!IN_ANDROID) {
      textSize(12);
      text("[press «r» to restart game]", width/2, height/2 + 100);
    }

  }

  void show_start_info() {
    fill(20);
    rect(0, height/2 - 25, width, 50);
    fill(color(255, 204, 0));
    textSize(35);
    textAlign(CENTER, CENTER);
    text("TOUCH SCREEN TO BEGIN", width/2, height/2);
  }

}
