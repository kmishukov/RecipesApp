//
//  RecipesListViewController.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import UIKit

class RecipesListViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        view.addSubview(tableView)
    }

}
