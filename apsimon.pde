// Simon Says for Android
// Javier Morales & David Díaz
// https://github.com/JAvilp/apsimon


Game game;        // Game object
Player player;    // Player object
CPU cpu;          // CPU object
Board board;      // Board object
int gridX;
int gridY;

void setup() {
  size(width, height);
  gridX = width/6;
  gridY = height/8;

  game = new Game();
  player = new Player();
  cpu = new CPU();
  board = new Board(gridX, gridY * 3, gridX * 4, gridY * 4);
}
