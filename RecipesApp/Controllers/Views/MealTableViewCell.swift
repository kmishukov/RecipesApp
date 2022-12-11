//
//  MealTableViewCell.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    static let cellIdentifier = "mealCell"

    private let titleLabel = UILabel(frame: .zero)
    private let mealImageView = UIImageView(frame: .zero)

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(contentView)
            $0.left.equalTo(contentView).inset(16)
        }

        contentView.addSubview(mealImageView)
        mealImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.left.greaterThanOrEqualTo(titleLabel.snp.right)
            $0.top.right.equalTo(contentView).inset(16)
            $0.bottom.equalTo(contentView).inset(16).priority(.medium)
        }
    }

    // MARK: - Interface

    func updateWithModel(_ model: Meal) {
        titleLabel.text = model.name
        mealImageView.kf.setImage(with: URL(string: model.imgUrl))
    }
}
