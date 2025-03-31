/*
 * Teenager
 * --------
 * Given a person's age, return true if the person is a teenager (age 13 - 19).
 * isTeenager(5) = false
 * isTeenager(15) = true
 */ 
public with sharing class Teenager {
    public Boolean isTeenager(Integer age) {
        Boolean isTeenager;
        if(age <= 12){
            isTeenager = false; 
        }else if(age >= 13  && age <= 19){
            isTeenager = true;
        }else if(age >= 20){
            isTeenager = false;
        }
        return isTeenager;
    }
}