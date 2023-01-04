public with sharing class Day02 extends AOC_BaseUtils {
  public Day02() {
      this.processInputLines('Day02_res');
      System.debug(this.inputLines);
      // this.integers = this.stringsToInt(this.inputLines);
    }
  
    public Integer totalScore = 0;

  
  /**
   * @method : countCalories
   * @return : void method (sets value of private member of class)
   */
    public Integer calculateScore() {

      Integer loss = 0;
      Integer draw = 3;
      Integer win = 6;
      Integer score = 0;
      Map<String, Integer> playScores = new Map<String,Integer>{'A' => 1, 'B' => 2, 'C' => 3 };

      // a bit hacky, assumes second column is us
      Set<String> winningCombos = new Set<String>{'A B', 'C A', 'B C'};
      for (Integer i = 0; i < this.inputLines.size(); i++) {

        string currentRound = this.inputLines[i].replace('X', 'A').replace('Y', 'B').replace('Z', 'C');
        List<String> splitScores = currentRound.split(' ');
        if(winningCombos.contains(currentRound))
        {
          score += win;
        }
        else if (splitScores[0]==splitScores[1]) {
          score += draw;
        }

        // add score for type of play
        score += playScores.get(splitScores[1]);
      }
      
      return score;
    }

  public Integer calculatePlay() {
    // ROCK = A, PAPER = B, SCISSORS = C
    Integer loss = 0;
    Integer draw = 3;
    Integer win = 6;
    Integer score = 0;

    final Integer WIN_IDX = 0;
    final Integer LOSE_IDX = 1;
    final Integer DRAW_IDX = 2;

    // score to add based on the hand played (Rock = 1, etc.)
    Map<String, Integer> playScores = new Map<String,Integer>{'A' => 1, 'B' => 2, 'C' => 3 };
    // score to add based on win/lose/draw
    Map<String, Integer> resultScores = new Map<String,Integer>{'X' => 0, 'Y' => 3, 'Z' => 6 };
    Map<String, List<String>> moveToPlay = new Map<String,List<String>>{  'A' => new List<String>{'B', 'C', 'A'},
                                                                          'B' => new List<String>{'C', 'A', 'B'},
                                                                          'C' => new List<String>{'A', 'B', 'C'}};

    // store index to look in in movesToPlay
    Map<String, Integer> resultIdx = new Map<String,Integer>{'X' => LOSE_IDX, 'Y' => DRAW_IDX, 'Z' => WIN_IDX };

    for (Integer i = 0; i < this.inputLines.size(); i++) {      
      List<String> splitScores = this.inputLines[i].split(' ');
      String opponentHand = splitScores[0];
      String neededResult = splitScores[1];
      System.debug(opponentHand);
      System.debug(neededResult);
      System.debug(score);

      // add lose/draw/win points
      score += resultScores.get(neededResult);
      System.debug(score);

      //get hand to play and add hand based points
      String handToPlay = moveToPlay.get(opponentHand)[resultIdx.get(neededResult)];
      score += playScores.get(handToPlay);
      System.debug(score);
      System.debug(handToPlay);
    }
    
    return score;
  }

  public void part1() {
      System.debug('Day 2 part 1 answer: ' + calculateScore());
    }

    public void part2() {
      System.debug('Day 2 part 2 answer: ' + calculatePlay());
    }
  
  }