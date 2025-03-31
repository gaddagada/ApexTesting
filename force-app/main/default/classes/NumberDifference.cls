/*
 * Number Difference 
 *------------------
 * Implement a function diff that calculates the absolute difference between two integers.
 * diff(5, 2) = 3
 * diff(2, 5) = 3
 */
public with sharing class NumberDifference {
    public Integer diff(Integer a, Integer b){
        if((a - b) >= 0){
            return a - b;
        }else{
            return b - a;
        }
    }
}