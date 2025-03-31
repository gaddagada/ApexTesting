public with sharing class EvenOrOdd {
    public String evenOrOdd(Integer num) {
        if( math.mod(num, 2) == 0){
            return 'even';
        }else{
            return 'odd';
        }
    }
}