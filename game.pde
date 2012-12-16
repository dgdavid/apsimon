import java.util.Random;

class Game {
  boolean game_started, game_is_over;
  int[] current_sequence = new int[0], previous_sequence = new int[0];
  SequenceThread sequence_thread;

  Game() {
    game_started = false;
    game_is_over = false;
  }

  boolean is_started() {
    return game_started;
  }

  boolean is_over() {
    return game_is_over;
  }

  void start_game() {
    game_started = true;
    new_sequence();
    show_current_sequence();
  }

  void next_level() {
    score+= level;
    level++;
    start_game();
    media_player.load_track("level_up.mp3");
    media_player.play();
  }

  void over() {
    game_is_over = true;
  }

  void new_sequence() {
    previous_sequence = current_sequence;
    current_sequence = new int[level];
    Random randomGenerator = new Random();

    //previous sequence...
    for (int idx = 0; idx < previous_sequence.length; idx++) {
      current_sequence[idx] = previous_sequence[idx];
    }

    //new sequence...
    for(int idx = previous_sequence.length; idx < current_sequence.length; idx++) {
      current_sequence[idx] = randomGenerator.nextInt(buttons.length);
    }
  }

  void show_current_sequence(){
    sequence_thread  = new SequenceThread(level, current_sequence);
    sequence_thread.start();
  }

  boolean has_been_successful(int[]user_sequence) {
    return Arrays.equals(current_sequence, user_sequence);
  }
}
