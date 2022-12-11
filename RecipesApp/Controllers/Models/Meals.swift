//
//  Meals.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let id: String
    let name: String
    let imgUrl: String

    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imgUrl = "strMealThumb"
        case id = "idMeal"
    }
}
