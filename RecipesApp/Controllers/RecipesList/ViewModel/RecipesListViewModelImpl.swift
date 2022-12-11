//
//  RecipesListViewModelImpl.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

final class RecipesListViewModelImpl: RecipesListViewModel {
    private(set) var meals: [Meal] = []

    func loadData(completion: @escaping () -> Void) {
        let urlStr = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian"
        guard let url = URL(string: urlStr) else { return }
        APIManager.networkRequest(url: url) { [weak self] response in
            if let data = response.data {
                do {
                    let newMeals = try JSONDecoder().decode(Meals.self, from: data)
                    self?.meals = newMeals.meals
                    completion()
                } catch (let err) {
                    print(err)
                }
            }
        }
    }
}
