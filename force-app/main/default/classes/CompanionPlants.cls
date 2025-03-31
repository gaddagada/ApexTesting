/*
 * Companion Plants 
 * -----------------
 * Some plants are considered companion plants. They grow better when planted next to each other. For the purpose of this problem, we consider the following 
 * plants to be companions: lettuce and cucumbers, lettuce and onions, onions and carrots, and onions and tomatoes.

Write a function isCompanion that takes as input two strings plant1 and plant2. If the two plants are companion plants based on the criteria described 
above, return true. Otherwise, return false.

companionPlants('onions', 'lettuce') = true

companionPlants('lettuce', 'tomatoes') = false
 */
public with sharing class CompanionPlants {
    public Boolean isCompanion(String plant1, String plant2) {
        // Define the companion plant pairs
        map<String,String> companionMap = new map<String,String>{
            'cucumbers' => 'lettuce',
            'onions' => 'lettuce',
            'carrots' => 'onions',
            'tomatoes' => 'onions'
        };

        // Check if the plants are companion plants based on the defined criteria
        // Return true if they are, false otherwise
        if ((companionMap.get(plant1) == plant2) || (companionMap.get(plant2) == plant1)) {
            return true;
        } else {
            return false;
        }
    }
}