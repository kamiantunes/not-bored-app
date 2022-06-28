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

    private lazy var participantsImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .black

        return imageView
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

    private lazy var priceImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(named: "dolar")
        imageView.tintColor = .black

        return imageView
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

    lazy var categorieImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(systemName: "list.dash")
        imageView.tintColor = .black

        return imageView
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

        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpViews() {
        addSubview(titleView)
        setUpConstraintsTitleView()
        
        titleView.addSubview(titleLabel)
        setUpConstraintsTitleLabel()
        
        titleView.addSubview(backButton)
        setUpConstraintsBackButton()
        
        addSubview(activityLabel)
        setUpConstraintsActivityLabel()
        
        addSubview(participantsImageView)
        setUpConstraintsParticipantsImageView()
        
        addSubview(participantsLabel)
        setUpConstraintsParticipantsLabel()
        
        addSubview(participantsNumberLabel)
        setUpConstraintsParticipantsNumberLabel()
        
        addSubview(priceImageView)
        setUpConstraintsPriceImageView()

        addSubview(priceLabel)
        setUpConstraintsPriceLabel()
        
        addSubview(priceRangeLabel)
        setUpConstraintsPriceRangeLabel()
        
        addSubview(categorieImageView)
        setUpConstraintsCategorieImageView()
        
        addSubview(nextButton)
        setUpConstraintsNextButton()
        
        addSubview(categorieLabel)
        setUpConstraintsCategorieLabel()
    }
    
    private func setUpConstraintsTitleView() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80)
        ])
    }
    
    private func setUpConstraintsTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)
        ])
    }
    
    private func setUpConstraintsBackButton() {
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
    
    private func setUpConstraintsActivityLabel() {
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(lessThanOrEqualTo: titleView.bottomAnchor, constant: 65),
            activityLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            activityLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }
    
    private func setUpConstraintsParticipantsImageView() {
        NSLayoutConstraint.activate([
            participantsImageView.widthAnchor.constraint(equalToConstant: 32),
            participantsImageView.heightAnchor.constraint(equalToConstant: 32),
            participantsImageView.topAnchor.constraint(lessThanOrEqualTo: activityLabel.bottomAnchor, constant: 65),
            participantsImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpConstraintsParticipantsLabel() {
        NSLayoutConstraint.activate([
            participantsLabel.centerYAnchor.constraint(equalTo: participantsImageView.centerYAnchor),
            participantsLabel.widthAnchor.constraint(equalToConstant: 200),
            participantsLabel.leadingAnchor.constraint(equalTo: participantsImageView.trailingAnchor, constant: 16)
        ])
    }
    
    private func setUpConstraintsParticipantsNumberLabel() {
        NSLayoutConstraint.activate([
            participantsNumberLabel.centerYAnchor.constraint(equalTo: participantsImageView.centerYAnchor),
            participantsNumberLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }
    
    private func setUpConstraintsPriceImageView() {
        NSLayoutConstraint.activate([
            priceImageView.widthAnchor.constraint(equalToConstant: 32),
            priceImageView.heightAnchor.constraint(equalToConstant: 32),
            priceImageView.topAnchor.constraint(equalTo: participantsImageView.bottomAnchor, constant: 16),
            priceImageView.leadingAnchor.constraint(equalTo: participantsImageView.leadingAnchor)
        ])
    }
    
    private func setUpConstraintsPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: priceImageView.centerYAnchor),
            priceLabel.widthAnchor.constraint(equalTo: participantsLabel.widthAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceImageView.trailingAnchor, constant: 16)
        ])
    }
    
    private func setUpConstraintsPriceRangeLabel() {
        NSLayoutConstraint.activate([
            priceRangeLabel.centerYAnchor.constraint(equalTo: priceImageView.centerYAnchor),
            priceRangeLabel.trailingAnchor.constraint(equalTo: participantsNumberLabel.trailingAnchor)
        ])
    }
    
    private func setUpConstraintsCategorieImageView() {
        NSLayoutConstraint.activate([
            categorieImageView.widthAnchor.constraint(equalToConstant: 32),
            categorieImageView.heightAnchor.constraint(equalToConstant: 32),
            categorieImageView.topAnchor.constraint(equalTo: priceImageView.bottomAnchor, constant: 16),
            categorieImageView.leadingAnchor.constraint(equalTo: participantsImageView.leadingAnchor)
        ])
    }
    
    private func setUpConstraintsCategorieLabel() {
        NSLayoutConstraint.activate([
            categorieLabel.centerYAnchor.constraint(equalTo: categorieImageView.centerYAnchor),
            categorieLabel.widthAnchor.constraint(equalTo: participantsLabel.widthAnchor),
            categorieLabel.leadingAnchor.constraint(equalTo: categorieImageView.trailingAnchor, constant: 16),
            categorieLabel.bottomAnchor.constraint(lessThanOrEqualTo: nextButton.topAnchor, constant: -16)
        ])
    }
    
    private func setUpConstraintsNextButton() {
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            nextButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
