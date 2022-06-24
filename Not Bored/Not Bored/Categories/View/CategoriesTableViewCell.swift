//
//  CategoriesTableViewCell.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

final class CategoriesTableViewCell: UITableViewCell {

    static let reuseId: String = "CategoriesTableViewCell"

    private lazy var categorieLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true

        return label
    }()

    private lazy var categorieIcon: UIImageView = {
        let icon = UIImageView()

        icon.translatesAutoresizingMaskIntoConstraints = false

        icon.image = UIImage(systemName: "greaterthan")
        icon.tintColor = .black

        return icon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .backgroundHome
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(with categorie: String) {
        categorieLabel.text = categorie
    }

    private func setupView() {
        addSubview(categorieLabel)
        addSubview(categorieIcon)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categorieLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            categorieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categorieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),

            categorieIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieIcon.heightAnchor.constraint(equalToConstant: 24),
            categorieIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
