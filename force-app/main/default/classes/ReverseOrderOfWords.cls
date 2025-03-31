/* 
Reverse Order of Words 
-----------------------
Implement a function reverseWordsInASentence that will take a String containing words separated by spaces as an argument, and return a string with the order of the words reversed.

Example : If the sentence is The quick brown fox jumps over the lazy dog, then reverseWordsInASentence(String sentence)
should evaluate to dog lazy the over jumps fox brown quick The
*/
public with sharing class ReverseOrderOfWords {
    public String reverseWordsInASentence(String sentence){
        if (sentence == null) {
            return null;
        } else if (sentence == '') {
            return '';
        }
    
        List<String> words = sentence?.split(' ');
        String reversed = '';

        for (Integer i = words.size()-1; i >= 0; i--) {
            if (reversed == '') {
                reversed += words[i];
            } else {
                reversed += ' ' + words[i];
            }
        }
        return reversed;
    }

}