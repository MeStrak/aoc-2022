public with sharing class Day03 extends AOC_BaseUtils {
    public Day03() {
        this.processInputLines('Day03_res');
      }
    
      public Integer totalScore = 0;
  
    /*******************************************************************************************************
    * @description Calculates and returns value of a given item
    * @param item the item to calculate the value for
    * @return the value (Integer) of the given item
    * @example
    * Integer val = calcItemValue('X');
    */
      public Integer calcItemValue(String item){
        final String alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        return alphabet.indexOfChar(item.charAt(0))+1;
      }

      
      public Integer getDupes() {
        Integer dupeValue = 0;

        for (Integer i = 0; i < this.inputLines.size(); i++) {
            String compartment1 = this.inputLines[i].substring(0, this.inputLines[i].length()/2);
            String compartment2 = this.inputLines[i].substring(this.inputLines[i].length()/2, this.inputLines[i].length());
            System.debug(compartment1);
            System.debug(compartment2);

            Set<String> seen = new Set<String>();
            for (Integer j = 0; j < compartment1.length(); j++) {
                if( compartment2.indexOfChar(compartment1.charAt(j))!=-1 &&
                    seen.add(compartment1.substring(j, j+1)))
                {
                    System.debug(compartment2.indexOfChar(compartment1.charAt(j)));
                    dupeValue+=calcItemValue(compartment1.substring(j, j+1));
                }
            }
        }
        
        return dupeValue;
      }

      public Integer getTriplicates() {
        Integer triplicateValue = 0;

        for (Integer i = 0; i < this.inputLines.size()-1; i+=3) {
          System.debug('idx: ' + i);

        //find longest string of the three
        // max of a and b >> current max
        // max of current and c
          Integer longestIdx;
          List<Integer>shortestIdxs = new List<Integer>();
          if(this.inputLines[i].length() > this.inputLines[i+1].length())
          {
            longestIdx = i;
            shortestIdxs.add(i+1);
          } else {
            longestIdx = i+1;
            shortestIdxs.add(i);
          }

          if(this.inputLines[longestIdx].length() > this.inputLines[i+2].length())
          {
            shortestIdxs.add(i+2);
          } else {
            shortestIdxs.add(longestIdx);
            longestIdx = i+2;
          }

            String bigRuck= this.inputLines[longestIdx];
            String smallRuck1 = this.inputLines[shortestIdxs[0]];
            String smallRuck2 = this.inputLines[shortestIdxs[1]];

            System.debug(bigRuck);
            System.debug(smallRuck1);
            System.debug(smallRuck2);

            Set<String> seen = new Set<String>();
            for (Integer j = 0; j < bigRuck.length(); j++) {
                if( smallRuck1.indexOfChar(bigRuck.charAt(j))!=-1)
                {
                    seen.add(bigRuck.substring(j, j+1));
                }
            }

            // search for all seen in strings 1 and 2 in third
            // break as soon as triplicate found
            for (String item: seen) {
              System.debug('looking for triplicate: ' + item);
              if( smallRuck2.indexOf(item)!=-1)
              {
                System.debug('triplicate found: ' + item);
                triplicateValue += calcItemValue(item);
                break;
              }
          }
        }
        return triplicateValue;
      }

  
    public void part1() {
        System.debug('Day 3 part 1 answer: ' + getDupes());
      }
  
      public void part2() {
        System.debug('Day 3 part 2 answer: ' + getTriplicates());
      }
    
    }