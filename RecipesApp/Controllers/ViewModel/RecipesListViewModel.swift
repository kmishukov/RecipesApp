//
//  RecipesListViewModel.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

protocol RecipesListViewModel {
    var meals: [Meal] { get }
    func loadData(completion: @escaping () -> Void)
}
