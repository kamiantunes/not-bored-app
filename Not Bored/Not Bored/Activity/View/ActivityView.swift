//
//  ActivityView.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import UIKit

final class ActivityView: UIView {

    private lazy var titleView: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .systemBlue

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black

        return label
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.setBackgroundImage(UIImage(systemName: "lessthan"), for: .normal)
        button.tintColor = .black

        return button
    }()

    lazy var activityLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0

        return label
    }()

    private lazy var participantsLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = "Participants"
        label.textAlignment = .left
        label.textColor = .black

        return label
    }()

    private lazy var participantsIcon: UIImageView = {
        let image = UIImageView()

        image.translatesAutoresizingMaskIntoConstraints = false

        image.image = UIImage(systemName: "person.fill")
        image.tintColor = .black

        return image
    }()

    lazy var participantsNumberLabel: UILabel = {
       let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .right
        label.textColor = .black

        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = "Price"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0

        return label
    }()

    private lazy var priceIcon: UIImageView = {
        let image = UIImageView()

        image.translatesAutoresizingMaskIntoConstraints = false

        image.image = UIImage(named: "dolar")
        image.tintColor = .black

        return image
    }()

    lazy var priceRangeLabel: UILabel = {
       let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .right
        label.textColor = .black

        return label
    }()

    lazy var categorieLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0

        return label
    }()

    lazy var categorieIcon: UIImageView = {
        let image = UIImageView()

        image.translatesAutoresizingMaskIntoConstraints = false

        image.image = UIImage(systemName: "list.dash")
        image.tintColor = .black

        return image
    }()

    lazy var nextButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.backgroundColor = .systemBlue
        button.setTitle("Try Another", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .backgroundHome

        setupViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        titleView.addSubview(titleLabel)
        titleView.addSubview(backButton)

        addSubview(titleView)
        addSubview(activityLabel)

        addSubview(participantsLabel)
        addSubview(participantsNumberLabel)
        addSubview(participantsIcon)

        addSubview(priceLabel)
        addSubview(priceRangeLabel)
        addSubview(priceIcon)

        addSubview(categorieLabel)
        addSubview(categorieIcon)

        addSubview(nextButton)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),

            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),

            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),

            activityLabel.topAnchor.constraint(lessThanOrEqualTo: titleView.bottomAnchor, constant: 65),
            activityLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            activityLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            participantsIcon.widthAnchor.constraint(equalToConstant: 32),
            participantsIcon.heightAnchor.constraint(equalToConstant: 32),
            participantsIcon.topAnchor.constraint(lessThanOrEqualTo: activityLabel.bottomAnchor, constant: 65),
            participantsIcon.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),

            participantsLabel.centerYAnchor.constraint(equalTo: participantsIcon.centerYAnchor),
            participantsLabel.widthAnchor.constraint(equalToConstant: 200),
            participantsLabel.leadingAnchor.constraint(equalTo: participantsIcon.trailingAnchor, constant: 16),

            participantsNumberLabel.centerYAnchor.constraint(equalTo: participantsIcon.centerYAnchor),
            participantsNumberLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            priceIcon.widthAnchor.constraint(equalToConstant: 32),
            priceIcon.heightAnchor.constraint(equalToConstant: 32),
            priceIcon.topAnchor.constraint(equalTo: participantsIcon.bottomAnchor, constant: 16),
            priceIcon.leadingAnchor.constraint(equalTo: participantsIcon.leadingAnchor),

            priceLabel.centerYAnchor.constraint(equalTo: priceIcon.centerYAnchor),
            priceLabel.widthAnchor.constraint(equalTo: participantsLabel.widthAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceIcon.trailingAnchor, constant: 16),

            priceRangeLabel.centerYAnchor.constraint(equalTo: priceIcon.centerYAnchor),
            priceRangeLabel.trailingAnchor.constraint(equalTo: participantsNumberLabel.trailingAnchor),

            categorieIcon.widthAnchor.constraint(equalToConstant: 32),
            categorieIcon.heightAnchor.constraint(equalToConstant: 32),
            categorieIcon.topAnchor.constraint(equalTo: priceIcon.bottomAnchor, constant: 16),
            categorieIcon.leadingAnchor.constraint(equalTo: participantsIcon.leadingAnchor),

            nextButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),

            categorieLabel.centerYAnchor.constraint(equalTo: categorieIcon.centerYAnchor),
            categorieLabel.widthAnchor.constraint(equalTo: participantsLabel.widthAnchor),
            categorieLabel.leadingAnchor.constraint(equalTo: categorieIcon.trailingAnchor, constant: 16),
            categorieLabel.bottomAnchor.constraint(lessThanOrEqualTo: nextButton.topAnchor, constant: -16)
        ])
    }
}
