public with sharing class Day07 {
    public Day07() {
        this.processInputLines('Day07_res');
    }

    private void buildDirTree(){
        Map<String, Integer> directories = new Map<String, Integer>();

        for (String cmd : this.inputLines) {
            if(cmd=='$ ls') {continue;}
            
            cmd.replace('$ ', '')

            String cmdArr = cmd.split(' ');

        }
    }

    //track current directory full path
    //if path list contains current path - add files
    //else add the path to path list
    //add dir total to this path and all roots

    //totalling list


    public void part1(){
        System.debug('Day 7 part 1 answer: ' + checkLetters(4));
    }

    public void part2(){
        System.debug('Day 7 part 2 answer: ' + checkLetters(14));
    }
}