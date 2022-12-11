//
//  SceneDelegate.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewModel = RecipesListViewModelImpl()
        let viewController = RecipesListViewController(viewModel: viewModel)
        viewController.title = "Canadian Meals 🇨🇦"
        let navigationController = UINavigationController(rootViewController: viewController)
        configureNavigationController(navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    private func configureNavigationController(_ navigationController: UINavigationController) {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationController.navigationBar.standardAppearance = navigationBarAppearance
        navigationController.navigationBar.compactAppearance = navigationBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}
