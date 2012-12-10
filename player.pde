class Player {
  int last_index;
  int[] user_sequence;

  Player() {
  }

  void start_new_level(int level) {
    last_index = 0;
    user_sequence = new int[level] ;
  }

  void recreate_sequence() {
    if(!already_finished()) {
      for(int i = 0; i < buttons.length; i++) {
        if(buttons[i].has_been_pressed()){
          user_sequence[last_index] = i;
          buttons[i].set_as_pressed();
          //redraw(); // FIXME: no debería estar por aquí...
          last_index++;
        }
      }
    }
  }

  boolean already_finished() {
    return game.current_sequence.length == last_index;
  }
}
