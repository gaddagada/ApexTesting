/**
 * AOrAn
 * -----
 * Given a work, prepend it with the correct indefinite article ("a" or "an") followed by a space based on the following 
 * rule: words starting with a vowel (a, e, i, o, or u) are prepended with "an", while words starting with any other letter 
 * are prepended with "a".
 * 
 * Example: 
 * --------
 * aOrAn('apple') = 'an apple'
 * aOrAn('banana') = 'a banana'
 */
public with sharing class AOrAn {
    public String aOrAn(String word) {
        if((word.startsWith('a') || 
            word.startsWith('e') || 
            word.startsWith('i') || 
            word.startsWith('o') || 
            word.startsWith('u'))){
            return 'an '+word;
        }else{
            return 'a ' + word;
        }
    }
}