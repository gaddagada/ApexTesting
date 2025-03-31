public with sharing class isEndWithZero {
    public Boolean isEndWithZero(Integer num){
        Integer remainder = 0; 
        remainder = Math.mod(num, 10);

        Boolean isLastDigitZero = false;
        if(remainder == 1){
            return isLastDigitZero = false;
        }else if(remainder == 0){
            return isLastDigitZero = true;
        }else{
            return isLastDigitZero = false;
        }

    }
}