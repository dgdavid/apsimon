
class CPU {
  
  CPU() {
     
    
  }
  
    
  int[] new_sequence() {
    int[] cpu_sequence = new int[level];
    Random randomGenerator = new Random();
    
    for (int idx = 0; idx < level; ++idx) {
      cpu_sequence[idx] = randomGenerator.nextInt(4);
    }
   
    return cpu_sequence;
    
  }
  

}
