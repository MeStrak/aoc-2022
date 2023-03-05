public with sharing class Day06 extends AOC_BaseUtils{
    public Day06(){
      this.processInputLines('Day06_res');
    }

    // iterate through letters
    // add each letter to 'seen', up to 4 things
    // if current letter matches something in seen, rest counter

    private Integer checkLetters(Integer distinct){
        String[] letters = this.inputLines[0].split('');
        String[] seen = new String[]{};

        for (Integer i = 0; i < letters.size(); i++) {
            String letter = letters[i];

            if(seen.contains(letter)) { 
                // System.debug('removing: ' + letter);
                // remove up to and including instance of seen letter
                for (Integer j = seen.indexOf(letter); j >= 0; j--) {
                    // System.debug('removing index: ' + j);
                    seen.remove(j);
                }
            }
            
            seen.add(letter);
            // System.debug(seen);
            if(seen.size() == distinct){
                return i+1;
            }
        }
        return -1;
    }
  
  
    public void part1(){
      System.debug('Day 6 part 1 answer: ' + checkLetters(4));
    }

    public void part2(){
        System.debug('Day 6 part 2 answer: ' + checkLetters(14));
      }
  }