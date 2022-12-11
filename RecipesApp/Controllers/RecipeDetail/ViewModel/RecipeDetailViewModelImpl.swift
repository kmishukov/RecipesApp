//
//  RecipeDetailViewModelImpl.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

final class RecipeDetailViewModelImpl: RecipeDetailViewModel {
    private let mealID: String
    private(set) var meal: MealDetails?

    init(mealID: String) {
        self.mealID = mealID
    }

    func loadData(completion: @escaping () -> Void) {
        let urlStr = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        guard let url = URL(string: urlStr) else { return }
        APIManager.networkRequest(url: url) { [weak self] response in
            if let data = response.data {
                do {
                    self?.meal = try JSONDecoder().decode(MealsDetails.self, from: data).meals.first
                    completion()
                } catch (let err) {
                    print(err)
                }
            }
        }
    }
}
