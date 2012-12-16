class VerticalLayout {
  int previous_level;
  color title_color;
  float gridX, gridY;      // layout divided in grid for elements positioning
  PFont droidsans, homestead;

  VerticalLayout() {
    previous_level = level;
    new_title_color();
    gridX = width/6;     // columns
    gridY = height/8;    // rows
    board = new Board(gridX, gridY * 3, gridX * 4, gridY * 4);
    droidsans = createFont("DroidSans", 16);
    homestead = createFont("Homestead-Display", 48);
  }

  void show_tittle() {
    if(previous_level != level) {
      previous_level = level;
      new_title_color();
    }
    fill(title_color);
    textSize(50);
    textAlign(CENTER);
    textFont(homestead);
    text("APSIMON", width/2, gridY);
  }

  void show_level_info() {
    fill(color(255,255,255));
    textSize(20);
    textAlign(LEFT);
    text("LEVEL: " + level, gridX, gridY * 2);
  }

  void show_score_info() {
    fill(color(255,255,255));
    textSize(20);
    textAlign(RIGHT);
    text("SCORE: " + score, gridX * 5, gridY * 2);
  }

  void set_layout(Board board, BoardButton buttons[]) {
    size(width, height);
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
    String[] buttons_audio = {"button1.mp3", "button2.mp3", "button3.mp3", "button4.mp3" };

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
      buttons[i].audio = buttons_audio[i];
      buttons[i].w = board.width/2;
      buttons[i].h = board.height/2;
    }
  }

  void show_board() {
    fill(255);
    noStroke();
    rect(board.x - 3, board.y - 3, board.width + 6, board.height + 6);
  }

  void show_background() {

    // http://www.openprocessing.org/sketch/9060

    loadPixels();
    float increment = map(0, 0, width, 0.005, 0.3);
    float xoff = 0.0; // Start xoff at 0
    float yoff = 0.0;   // For every xoff, start yoff at 0
    // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
    for (int x = 0; x < width; x++) {
      xoff += increment;   // Increment xoff
      //yoff = 0.0;
      for (int y = 0; y < height; y++) {
        yoff += increment; // Increment yoff
        // Calculate noise and scale by 155
        float bright = noise(xoff,yoff)*155;
        // Set each pixel onscreen to a grayscale value
        pixels[x+y*width] = color(bright);
      }
    }
    updatePixels();
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
    textSize(60);
    text("GAME OVER", width/2, height/2);
    if(!IN_ANDROID) {
      textFont(droidsans);
      textSize(12);
      text("[press «r» to restart game or «e» to exit]", width/2, height/2 + 100);
    }

  }

  void show_start_info() {
    fill(20);
    rect(0, height/2 - 25, width, 60);
    fill(color(255, 204, 0));
    textSize(35);
    textAlign(CENTER, CENTER);
    text("TOUCH SCREEN TO BEGIN", width/2, height/2);
  }

  void show_next_level_info() {
    print("yeah");
    show_background();
    fill(title_color);
    textAlign(CENTER, CENTER);
    textFont(homestead);
    textSize(65);
    textAlign(CENTER, CENTER);
    text("GOOD!!", width/2, height/2);
    fill(color(255, 204, 0));
    textSize(30);
    textFont(droidsans);
    text("Going to next level ", width/2, height/2 + 100);

  }

  void new_title_color() {
    title_color = color(random(255),random(255),random(255));
  }

}
