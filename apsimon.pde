// Simon Says for Android
// Javier Morales & David Díaz
// https://github.com/JAvilp/apsimon

import ddf.minim.Minim;
import ddf.minim.AudioPlayer;
import apwidgets.APMediaPlayer;
import java.util.Random;

int level = 1;
int score = 0;
boolean IN_ANDROID = System.getProperty("java.vendor") == "The Android Project";

APMediaPlayer media_player;
Minim minim;
AudioPlayer song;
Game game;        // Game object
Player player;    // Player object
Board board;      // Board object
VerticalLayout layout;
int gridX;
int gridY;

BoardButton[] buttons = new BoardButton[4];

void setup() {
  int screen_width = IN_ANDROID ? width : 500;
  int screen_height = IN_ANDROID ? height : 600;
  size (screen_width, screen_height);
  frameRate(5);
  //media_player = new APMediaPlayer(this);
  //media_player.setMediaFile("sound.mp3");
  minim = new Minim(this);

  noLoop();
  game = new Game();
  player = new Player();
  layout = new VerticalLayout();
  layout.set_layout(board, buttons);
  player.start_new_level(level);

  //println(System.getProperty("java.vendor"));
  //song = minim.loadFile("sound.mp3");
  //song.play();


}
/*void show_current_sequence() {
  game.show_current_sequence();
  }*/
void startGame() {
  //game.get_cpu_sequence();
}


void draw() {
 
  if(game.is_over()) {
    layout.show_game_over(); 
  } else {
    background(155);
    layout.show_tittle();
    layout.show_level_info();
    layout.show_score_info();
    layout.show_buttons();
    //thread("startGame");
    //media_player.start();
    //song = minim.loadFile("sound13.mp3");
    //song.play();
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
  if(game.is_over() && key == 'r') {
    setup();
    redraw();
  }
}

void next_level() {
  game.next_level();
  player.start_new_level(level);
  redraw();
}

void game_finished() {
  game.over();
  redraw();
}
