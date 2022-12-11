//
//  RecipeDetailViewController.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    private let mealImageView = UIImageView(frame: .zero)
    private let labelsBackgroundView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let difficultyLabel = UILabel(frame: .zero)
    private let scrollView = UIScrollView(frame: .zero)
    private let instructionsContainer = UIStackView(frame: .zero)
    private let instructionsLabel = UILabel(frame: .zero)

    let viewModel: RecipeDetailViewModel

    // MARK: - Init

    init(viewModel: RecipeDetailViewModel) {
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
            self?.updateViews()
        }
    }

    private func setupViews() {
        mealImageView.clipsToBounds = true
        mealImageView.contentMode = .scaleAspectFill
        view.addSubview(mealImageView)
        mealImageView.snp.makeConstraints {
            $0.top.equalTo(view.snp_topMargin)
            $0.left.right.equalTo(view)
            $0.height.equalTo(200)
        }

        labelsBackgroundView.backgroundColor = .black.withAlphaComponent(0.4)
        mealImageView.addSubview(labelsBackgroundView)
        labelsBackgroundView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(mealImageView)
        }

        difficultyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        difficultyLabel.textColor = .white
        labelsBackgroundView.addSubview(difficultyLabel)
        difficultyLabel.snp.makeConstraints {
            $0.left.equalTo(labelsBackgroundView).inset(16)
            $0.bottom.equalTo(labelsBackgroundView).inset(10)
            $0.right.equalTo(labelsBackgroundView).inset(16)
        }

        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textColor = .white
        labelsBackgroundView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(labelsBackgroundView).inset(10)
            $0.left.equalTo(labelsBackgroundView).inset(16)
            $0.bottom.equalTo(difficultyLabel.snp.top)
            $0.right.equalTo(labelsBackgroundView).inset(16)
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(mealImageView.snp.bottom).offset(5)
            $0.left.right.equalTo(view)
            $0.bottom.equalTo(view)
        }

        instructionsContainer.axis = .vertical
        scrollView.addSubview(instructionsContainer)
        instructionsContainer.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.left.right.equalTo(view).inset(16)
        }

        instructionsLabel.numberOfLines = 0
        instructionsLabel.textAlignment = .justified
        instructionsContainer.addArrangedSubview(instructionsLabel)
    }

    private func updateViews() {
        if let urlStr = viewModel.meal?.imgUrl {
            let url = URL(string: urlStr)
            mealImageView.kf.setImage(with: url)
        }
        titleLabel.text = viewModel.meal?.name
        difficultyLabel.text = viewModel.meal?.difficulty
        instructionsLabel.text = viewModel.meal?.instructions
    }
}
