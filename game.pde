class Game {
  
  int[] cpu_sequence;

  Game() {
  }
  
  void get_cpu_sequence(){
    for(int i = 0; i < cpu.current_sequence.length; i++){
      int btnx = cpu.current_sequence[i];
      buttons[btnx].show_pressed();
      redraw();
      buttons[btnx].show();
      redraw();
      
    }
  }

}
