class SequenceThread extends Thread {

  boolean is_running;
  int id;
  int[] sequence;

  SequenceThread (int level, int[] current_sequence ) {
    id = level;
    is_running = false;
    sequence = current_sequence;
  }

  void start () {
    is_running = true;
    super.start();
  }

  void run () {
    int i = 0;
    int lastTime = millis();
    loop();
    while(i < sequence.length || millis() - lastTime < 500) {
      if(millis() - lastTime > 500) {
        buttons[sequence[i]].is_pressed = true;
        println(sequence[i]);
        i++;
        lastTime= millis();
      }
    }
    noLoop();
    quit();
  }

  void quit() {
    is_running = false;
    interrupt();
  }
}
