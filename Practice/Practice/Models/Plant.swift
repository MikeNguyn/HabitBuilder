//
//  Plant.swift
//  Practice
//
//  Created by Matthew Mukai on 4/19/23.
//
// This data model class helps us store the plant name and stage tied together so that when a habit stores a plant, the stage is tied too.

import Foundation
import SwiftUI


struct Plant: Hashable, Identifiable, Codable {
    var plant: String
    var stage: Int
    var id: UUID
    
    init(id: UUID = UUID()) {
        self.id = id
        self.plant = ""
        self.stage = 0
    }
    
    init(id: UUID = UUID(), plant: String, stage: Int) {
        self.id = id
        self.plant = plant
        self.stage = stage
        //        self.image = image
        //        self.habit = habit
    }
    
    //These are the different type of images associated with names of the plants. It returns the image of the named plant with its correct stage
    var image: Image {
        if plant == "tomato" {
            return checkPlantGrowth(plantName: "tomatoPlant", plantStage: self.stage)
        }
        if plant == "blueberry" {
            return checkPlantGrowth(plantName: "blueberryPlant", plantStage: self.stage)
        }
        if plant == "carrot" {
            return checkPlantGrowth(plantName: "carrotPlant", plantStage: self.stage)
        }
        if plant == "corn" {
            return checkPlantGrowth(plantName: "cornPlant", plantStage: self.stage)
        }
        if plant == "sunflower" {
            return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: self.stage)
        }
        if plant == "orchid" {
            return checkPlantGrowth(plantName: "orchidPlant", plantStage: self.stage)
        }
        if plant == "pea" {
            return checkPlantGrowth(plantName: "peaPlant", plantStage: self.stage)
        }
        if plant == "strawberry" {
            return checkPlantGrowth(plantName: "strawberryPlant", plantStage: self.stage)
        }
        return Image("Error")
        
    }
    
    //This function takes in a string and plant stage and returns the correct image from assets.
    func checkPlantGrowth(plantName: String, plantStage: Int)->Image{
        var suffix = "Small"
        if (plantStage == 2){
            suffix = "Med"
        } else if (plantStage == 3){
            suffix = "Full"
        }
        var imageName = plantName + suffix
        return Image(imageName)
    }
    
}

