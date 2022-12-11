//
//  MealDetail.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

struct MealsDetails: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Decodable {
    let id: String
    let name: String
    let imgUrl: String
    let instructions: String
    var difficulty: String {
        "Difficulty: \(Int.random(in: 1...5))/5"
    }

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imgUrl = "strMealThumb"
        case instructions = "strInstructions"
    }
}
