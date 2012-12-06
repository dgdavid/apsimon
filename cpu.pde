
class CPU {
  int[] current_sequence;
  
  CPU() {
     
    
  }
  
    
  void new_sequence() {
    int[] cpu_sequence = new int[level];
    Random randomGenerator = new Random();
    
    for (int idx = 0; idx < level; ++idx) {
      cpu_sequence[idx] = randomGenerator.nextInt(4);
    }
   
    current_sequence = cpu_sequence;
    
  }
  

}
