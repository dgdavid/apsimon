// Simon Says for Android
// Javier Morales & David Díaz
// https://github.com/JAvilp/apsimon

import java.util.Random;

int level = 15;
int score = 0;

Game game;        // Game object
Player player;    // Player object
CPU cpu;          // CPU object
Board board;      // Board object
VerticalLayout layout; 
int gridX;
int gridY;

BoardButton[] buttons = new BoardButton[4];

void setup() {
  size (500,500);
  noLoop();
  frameRate(1);
  game = new Game();
  player = new Player();
  cpu = new CPU();
  cpu.new_sequence();
  layout = new VerticalLayout();
  layout.set_layout(board, buttons);  
  game.get_cpu_sequence();
  
}

void draw() {
 layout.show_tittle();
 layout.show_level_info();
 layout.show_score_info();
 
}
