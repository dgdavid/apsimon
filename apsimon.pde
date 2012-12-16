// Simon Says for Android
// Javier Morales & David Díaz
// https://github.com/JAvilp/apsimon

int level;
int score;
boolean IN_ANDROID = System.getProperty("java.vendor") == "The Android Project";

Game game;        // Game object
Player player;    // Player object
Board board;      // Board object
MediaPlayer media_player = new MediaPlayer(this);
VerticalLayout layout;
BoardButton[] buttons = new BoardButton[4];

void setup() {

  level = 1;
  score = 0;

  if(!IN_ANDROID) {
    size (500, 600);
  }
  frameRate(5);
  noLoop();

  game = new Game();
  player = new Player();
  layout = new VerticalLayout();
  layout.set_layout(board, buttons);
  player.start_new_level(level);

}

void draw() {

  if(game.is_over()) {
    layout.show_game_over();
  } else {
    layout.show_background();
    layout.show_tittle();
    layout.show_level_info();
    layout.show_score_info();
    layout.show_board();
    layout.show_buttons();
  }

   if(!game.is_started()) {
    layout.show_start_info();
  }

}

void mousePressed() {

  if(!game.is_started()) {
    game.start_game();
    redraw();
  }

  if(!game.sequence_thread.is_running && !player.already_finished()){
    player.recreate_sequence();
    redraw();
  }

}

void mouseReleased() {

  if( !game.sequence_thread.is_running && player.already_finished() ) {
    if(game.has_been_successful(player.user_sequence)) {
      next_level();
    } else {
      game_finished();
    }
  }

}

void keyPressed() {

  if(game.is_over()) {
    switch(key) {
      case 'r':
      case 'R':
        setup();
        redraw();
        break;
      case 'e':
      case 'E':
        exit();
        break;
      default:
    }
  }

}

void next_level() {

  game.next_level();
  player.start_new_level(level);
  redraw();

}

void game_finished() {

  if(!game.is_over()) {
    game.over();
    redraw();
  }

}
