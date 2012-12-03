class Board {
  float x, y, board_width, board_height;
  BoardButton[] buttons = new BoardButton[4];
  
  Board(float posX, float posY, float w, float h) {
    x = posX;
    y = posY;
    board_height = h;
    board_width = w; 
    set_buttons();
  }
  
  void set_buttons() {
    
    int[] buttons_colors = { 255, 250, 100, 150 };
    float[][] buttons_position = {  { x, y },
                                    { board_width/2 + x, y },
                                    { x, board_height/2 + y },
                                    { board_width/2 + x, board_height/2 + y }  };

    
    for(int i = 0; i < buttons.length; i++) {
     buttons[i] =  new BoardButton();
     buttons[i].x = buttons_position[i][0];
     buttons[i].y =  buttons_position[i][1];
     buttons[i].bg =  buttons_colors[i];
     buttons[i].w = board_width/2;
     buttons[i].h = board_height/2;

     buttons[i].show();
    }
  }

}
