/*
 * Which Two
 * ----------
 * Given Integers a, b, and c, determine if any two of them add up to the third and return 'a', 'b', 'c' depending on which the sum is. 
 * If no two numbers add up to a third number, return an empty string. Assume that multiple solutions do not exist.

whichTwo(5, 10, 5) = 'b'

whichTwo(2, 0, 3) = ''
 * 
 */
public with sharing class WhichTwo {
    public String whichTwo(Integer a, Integer b, Integer c){
        if(a+b == c){
            return 'c';
        }
        if(a + c == b){
            return 'b';
        }
        if(b + c == a){
            return 'a';
        }
        return '';
    }
}