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

    private lazy var categorieImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(systemName: "greaterthan")
        imageView.tintColor = .black

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .backgroundHome
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(with categorie: String) {
        categorieLabel.text = categorie
    }

    private func setUpViews() {
        addSubview(categorieLabel)
        setUpConstraintsCategorieLabel()
        
        addSubview(categorieImageView)
        setUpConstraintsCategorieImageView()
        
        
    }
    
    private func setUpConstraintsCategorieLabel() {
        NSLayoutConstraint.activate([
            categorieLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            categorieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categorieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ])
    }
    
    private func setUpConstraintsCategorieImageView() {
        NSLayoutConstraint.activate([
            categorieImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieImageView.heightAnchor.constraint(equalToConstant: 24),
            categorieImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
