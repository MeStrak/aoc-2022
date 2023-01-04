public with sharing class Day04 extends AOC_BaseUtils {
    public Day04() {
        this.processInputLines('Day04_res');
      }
    
      public Integer totalScore = 0;
  
    
      public Integer getFullOverlaps() {
        
        //pair 1 a-b, pair2 x-z
        //if x>=a && z<=b
        //or if a>=x && b<=z
        // then ranges fully overlap
        
        Integer overlaps = 0;
  
        for (Integer i = 0; i < this.inputLines.size(); i++) {
            List<String> rangeStrings = this.inputLines[i].split('-|,');
            List<Integer> ranges = new List<Integer>{   Integer.valueOf(rangeStrings[0]),
                                                        Integer.valueOf(rangeStrings[1]),
                                                        Integer.valueOf(rangeStrings[2]),
                                                        Integer.valueOf(rangeStrings[3])};
            if( (ranges[0]>=ranges[2] && ranges[1]<=ranges[3])||
                (ranges[2]>=ranges[0] && ranges[3]<=ranges[1]))
            {

                overlaps +=1;
            }

        }
        
        return overlaps;
      }

      public Integer getPartialOverlaps() {
        
        //pair 1 a-b, pair2 x-z
        //if x>=a && z<=b
        //or if a>=x && b<=z
        // then ranges fully overlap
        
        Integer overlaps = 0;
  
        for (Integer i = 0; i < this.inputLines.size(); i++) {
            System.debug(this.inputLines[i]);
            List<String> rangeStrings = this.inputLines[i].split('-|,');
            List<Integer> ranges = new List<Integer>{   Integer.valueOf(rangeStrings[0]),
                                                        Integer.valueOf(rangeStrings[1]),
                                                        Integer.valueOf(rangeStrings[2]),
                                                        Integer.valueOf(rangeStrings[3])};
            
            if( isBetweenInclusive(ranges[2], ranges[0], ranges[1])||
                isBetweenInclusive(ranges[3], ranges[0], ranges[1])||
                isBetweenInclusive(ranges[0], ranges[2], ranges[3])||
                isBetweenInclusive(ranges[1], ranges[2], ranges[3]))
            {

                overlaps +=1;
            }
            else{
                system.debug('no overlap');
            }
        }
        
        return overlaps;
      }

      public Boolean isBetweenInclusive(Integer input, Integer lower, integer upper)
        {
            return lower<=input && upper>=input;
        }
  
    public void part1() {
        System.debug('Day 4 part 1 answer: ' + getFullOverlaps());
      }
  
      public void part2() {
        System.debug('Day 4 part 2 answer: ' + getPartialOverlaps());
      }
    
    }