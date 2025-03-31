/*
 * Age Group
 * ----------
 * Given a person's age, return their age group as a string: 'Infant' for ages 0-1, 'Child' for ages 2 - 14, 'Youth' for ages 15 - 21, and 'Adult' for ages 22+.

ageGroup(5) = 'Child'
*/
public with sharing class AgeGroup {
    public String ageGroup(Integer n) {
        if(n >= 0  && n <= 1){
            return 'Infant';
        } else if(n >= 2 && n <= 14){
            return 'Child';
        } else if(n >= 15 && n <= 21){
            return 'Youth';
        }else if(n >= 22){
            return 'Adult';
        }
        // Default case for invalid ages (e.g., negative numbers)
        return 'Invalid age';
    }
}