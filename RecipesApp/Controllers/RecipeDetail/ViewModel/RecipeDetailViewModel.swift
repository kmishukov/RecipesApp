//
//  RecipeDetailViewModel.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

protocol RecipeDetailViewModel {
    init(mealID: String)
    var meal: MealDetails? { get }
    func loadData(completion: @escaping () -> Void)
}
