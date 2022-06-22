//
//  CategoriesTableViewCell.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .backgroundHome
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public lazy var cellButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backgroundHome

        return button
    }()

    private lazy var categorieLabel: UILabel = {
        let label = UILabel()

        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
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



    func set(with categorie: String) {
        categorieLabel.text = categorie
    }

    func setupView() {
        cellButton.addSubview(categorieLabel)
        cellButton.addSubview(categorieIcon)
        addSubview(cellButton)

        categorieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        categorieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        categorieLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categorieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true

        categorieIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        categorieIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        //categorieIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        categorieIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categorieIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true

        cellButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cellButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cellButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true



//        addSubview(categorieIcon)
//
//        categorieIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        categorieIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //selectionStyle = .none







//        categorieIcon.leadingAnchor.constraint(equalTo: categorieIcon.trailingAnchor, constant: 5).isActive = true
//        categorieIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        categorieIcon.widthAnchor.constraint(equalToConstant: 5).isActive = true
//        categorieIcon.heightAnchor.constraint(equalToConstant: 5).isActive = true


    }
}
