public with sharing class Day05 extends AOC_BaseUtils{
  public Day05(){
    this.processInputLines('Day05_res');
  }

  List<String[]> stacks;
  // returns start of instructions idx
  private Integer readStartLayout(){
    final Integer WIDTH = 3;
    final Integer PAD = 1;
    stacks = new List<List<String>>((this.inputLines[0].length() + 1) / (WIDTH + PAD));

    for (Integer i = 0; i < this.inputLines.size(); i++){
      String ln = this.inputLines[i];
      if (ln.substring(1, 2) == '1'){
        return i; // stack ID row - stop looping
      }

      for (Integer j = 0; j < ln.length(); j += WIDTH + PAD){
        String stackSlot = ln.substring(j, j + WIDTH);
        if (stackSlot == '   '){
          continue; //skip to next if slot is empty
        }

        stackSlot = stackSlot.replace('[', '');
        stackSlot = stackSlot.replace(']', '');

        final Integer STACK_IDX = j/4;
        if (stacks[STACK_IDX] == null){
          stacks[STACK_IDX] = new String[]{  };
        }

        stacks[STACK_IDX].add(stackSlot);
      }
    }
    return  - 1;
  }

  private void processInstructions9000(Integer startIdx){
    for (Integer i = startIdx; i < this.inputLines.size(); i++){
      String[] instruction = this.inputLines[i].split(' ');
      Integer quantity = Integer.valueOf(instruction[1]);
      Integer origin = Integer.valueOf(instruction[3]) - 1;
      Integer target = Integer.valueOf(instruction[5]) - 1;

      for (Integer j = 0; j < Integer.valueOf(quantity); j++){
        if (stacks[target].size() == 0){
          stacks[target].add(stacks[origin].get(0));
        } else {
        stacks[target].add(0, stacks[origin].get(0));}
        stacks[origin].remove(0);
      }
    }
  }

  private void processInstructions9001(Integer startIdx){
    for (Integer i = startIdx; i < this.inputLines.size(); i++){
      String[] instruction = this.inputLines[i].split(' ');
      Integer quantity = Integer.valueOf(instruction[1]);
      Integer origin = Integer.valueOf(instruction[3]) - 1;
      Integer target = Integer.valueOf(instruction[5]) - 1;

      for (Integer j = 0; j < Integer.valueOf(quantity); j++){
        if (stacks[target].size() <= j){
          stacks[target].add(stacks[origin].get(0));
        } else {
        stacks[target].add(j, stacks[origin].get(0));}
        stacks[origin].remove(0);
      }
    }
  }

  private String getTopRow(){
    String topRow = '';
    for (String[] stack : stacks){
      topRow += stack[0];
    }
    return topRow;
  }

  // List<List<String> with 3 rows for the stack
  // iterate through list
  // string split by ' '
  // idxs: quantity=1, origin=3, destination= 5
  // for quantity: pop from stack[origin], push to stack[destination]
  // Setup stacks:
  // For row in input
  // string.split ' '
  // push each idx to related idx in stack
  public void part1(){
    Integer endStackIdx = readStartLayout();
    processInstructions9000(endStackIdx + 2);
    System.debug('Day 5 part 1 answer: ' + getTopRow());
  }

  public void part2(){
    Integer endStackIdx = readStartLayout();
    processInstructions9001(endStackIdx + 2);
    System.debug('Day 5 part 2 answer: ' + getTopRow());
    }
}