//
//  RecipesListViewController.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import UIKit

class RecipesListViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    var viewModel: RecipesListViewModel

    // MARK: - Init

    init(viewModel: RecipesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()

        viewModel.loadData { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func setupViews() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }

}

// MARK: - UITableViewDatasource
extension RecipesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.meals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = viewModel.meals[indexPath.row]
        cell.textLabel?.text = model.name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RecipesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
