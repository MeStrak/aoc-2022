public with sharing class Day01 extends AOC_BaseUtils {
    public Day01() {
        this.processInputLines('Day01_res');
        System.debug(this.inputLines);
        countCalories();
        // this.integers = this.stringsToInt(this.inputLines);
      }
    
      public Long increment = 0;
      List<Integer> elfTotals = new List<Integer>();

    
    /**
     * @method : countCalories
     * @return : void method (sets value of private member of class)
     */
      public void countCalories() {
        elfTotals.add(0);

        for (Integer i = 0; i < this.inputLines.size() - 1; i++) {
            // blank line? new elf
            if (!this.inputLines[i].isNumeric()) {
                elfTotals.add(0);
                continue;
            }
            
            // add to current elf
            elfTotals[elfTotals.size()-1] += Integer.valueOf(this.inputLines[i]);
        }
        elfTotals.sort();
      }

    /**
     * @method : part1
     * @return : void method, outputs part1 answer to console
     */
    public void part1() {
        System.debug('Part 1 answer: ' + elfTotals[elfTotals.size()-1]);
      }
    
    /**
     * @method : part2
     * @return : void method, outputs part1 answer to console
     */
    public void part2() {
        Integer totalCals = 0;
        totalCals += elfTotals[elfTotals.size()-1];
        totalCals += elfTotals[elfTotals.size()-2];
        totalCals += elfTotals[elfTotals.size()-3];
        System.debug('Part 2 answer: ' + totalCals);
      }
    }