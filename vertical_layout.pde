class VerticalLayout {
  
  VerticalLayout() {
  
  } 
  
  void set_layout(Board board, BoardButton buttons[]) {
    size(width, height);
    gridX = width/6;
    gridY = height/8;
    set_board(board, buttons, gridX, gridY);
  }
    
  void set_board(Board board, BoardButton buttons[], float gridX, float gridY) {
    board = new Board(gridX, gridY * 3, gridX * 4, gridY * 4);
    println(board.height);
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
    
    int[] buttons_colors = { colorgreen, colorred, coloryellow, colorblue };
    int[] buttons_flash_colors = { flashcolorgreen, flashcolorred, flashcoloryellow, flashcolorblue };
    
    float[][] buttons_position = {  { board.x, board.y },
                                    { board.width/2 + board.x, board.y },
                                    { board.x, board.height/2 + board.y },
                                    { board.width/2 + board.x, board.height/2 + board.y }  };

    
    for(int i = 0; i < buttons.length; i++) {
     buttons[i] =  new BoardButton();
     buttons[i].x = buttons_position[i][0];
     buttons[i].y =  buttons_position[i][1];
     buttons[i].bg =  buttons_colors[i];
     buttons[i].pressed_bg =  buttons_flash_colors[i];
     buttons[i].w = board.width/2;
     buttons[i].h = board.height/2;
     println(board.height);

     buttons[i].show();
    }
  }


}
