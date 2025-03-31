/**
 * Largest of Three 
 * ----------------
 * Given three Integers, return the largest
 * @param num1 
 * @param num2 
 * @param num3 
 * @return  `Integer`
 */
public with sharing class LargestOfThree {
    public static Integer findLargest(Integer num1, Integer num2, Integer num3) {
        if(num1 > num2){
            if(num1 > num3){
                return num1;
            }else{
                return num3;
            }
        }else{
            if(num2 > num3){
                return num2;
            }else{
                return num3;
            }
        }
    }
}