//
//  Plant.swift
//  Practice
//
//  Created by Matthew Mukai on 4/19/23.
//

import Foundation
import SwiftUI

struct Plant: Hashable, Identifiable, Codable {
    var plant: String
//    var image: Image
    var stage: Int
    var id: UUID
//    var habit: Habit
    
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
    
    var image: Image {
        if plant == "tomato" {
            return checkPlantGrowth(plantName: "tomatoPlant", plantStage: self.stage)
        }
        if plant == "blueberry" {
            return checkPlantGrowth(plantName: "blueberryPlant", plantStage: self.stage)
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
        return Image("Error")
        
    }
    
//        case blueberry2
//        case orchid2
//        case tomato2
//        case corn2
//        case sunflower2
//        case pea2
//
//        case blueberry3
//        case orchid3
//        case tomato3
//        case corn3
//        case sunflower3
//        case pea3
    
    

//    var image: Image {
//        switch self {
//        case .blueberry: return checkPlantGrowth(plantName: "blueberryPlant", plantStage: habit.stage)
//        case .orchid: return checkPlantGrowth(plantName: "orchidPlant", plantStage: stage)
//        case .tomato: return checkPlantGrowth(plantName: "tomatoPlant", plantStage: stage)
//        case .sunflower: return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: stage)
//        case .corn: return checkPlantGrowth(plantName: "cornPlant", plantStage: stage)
//        case .pea: return checkPlantGrowth(plantName: "peaPlant", plantStage: stage)
//
//
//            case .blueberry(stage: 1): return checkPlantGrowth(plantName: "blueberryPlant", plantStage: 1)
//            case .blueberry(stage: 2): return checkPlantGrowth(plantName: "blueberryPlant", plantStage: 2)
//            case .blueberry(stage: 3): return checkPlantGrowth(plantName: "blueberryPlant", plantStage: 3)
//            case .orchid(stage: 1): return checkPlantGrowth(plantName: "orchidPlant", plantStage: 1)
//            case .orchid(stage: 2): return checkPlantGrowth(plantName: "orchidPlant", plantStage: 2)
//            case .orchid(stage: 3): return checkPlantGrowth(plantName: "orchidPlant", plantStage: 3)
//            case .tomato(stage: 1): return checkPlantGrowth(plantName: "tomatoPlant", plantStage: 1)
//            case .tomato(stage: 2): return checkPlantGrowth(plantName: "tomatoPlant", plantStage: 2)
//            case .tomato(stage: 3): return checkPlantGrowth(plantName: "tomatoPlant", plantStage: 3)
//            case .sunflower(stage: 1): return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: 1)
//            case .sunflower(stage: 2): return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: 2)
//            case .sunflower(stage: 3): return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: 3)
//            case .corn(stage: 1): return checkPlantGrowth(plantName: "cornPlant", plantStage: 1)
//            case .corn(stage: 2): return checkPlantGrowth(plantName: "cornPlant", plantStage: 2)
//            case .corn(stage: 3): return checkPlantGrowth(plantName: "cornPlant", plantStage: 3)
//            case .pea(stage: 1): return checkPlantGrowth(plantName: "peaPlant", plantStage: 1)
//            case .pea(stage: 2): return checkPlantGrowth(plantName: "peaPlant", plantStage: 2)
//            case .pea(stage: 3): return checkPlantGrowth(plantName: "peaPlant", plantStage: 3)
//                case .blueberry: return Image("blueberryPlantSmall")
//                case .orchid: return Image("orchidPlantSmall")
//                case .tomato: return Image("tomatoPlantSmall")
//                case .sunflower: return Image("sunflowerPlantSmall")
//                case .corn: return Image("cornPlantSmall")
//                case .pea: return Image("peaPlantSmall")
//
//                case .blueberry2: return Image("blueberryPlantMed")
//                case .orchid2: return Image("orchidPlantMed")
//                case .tomato2: return Image("tomatoPlantMed")
//                case .sunflower2: return Image("sunflowerPlantMed")
//                case .corn2: return Image("cornPlantMed")
//                case .pea2: return Image("peaPlantMed")
//
//                case .blueberry3: return Image("blueberryPlantFull")
//                case .orchid3: return Image("orchidPlantFull")
//                case .tomato3: return Image("tomatoPlantFull")
//                case .sunflower3: return Image("sunflowerPlantFull")
//                case .corn3: return Image("cornPlantFull")
//                case .pea3: return Image("peaPlantFull")<#code#>
}
    
//        var imageHalf: Image {
//            switch self {
//            case .tomato: return Image("tomatoPlantMid")
//            }
//        }
    
//    var description: String{
//        return String(describing: self)
//    }
//
//    var id: String {
//        return self.description
//    }

