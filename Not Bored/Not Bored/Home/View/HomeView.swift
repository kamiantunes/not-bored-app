//
//  HomeView.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import UIKit

final class HomeView: UIView {

    private lazy var notBoredLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Not Bored"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center

        return label
    }()

    private lazy var participantsLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Participants:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()

    lazy var participantsTextField: UITextField = {
        let textField = UITextField()

        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Ex: 3"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Price:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()
    
    lazy var priceTextField: UITextField = {
        let textField = UITextField()

        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Ex: 0.5 (Max: 1)"
        textField.keyboardType = .numbersAndPunctuation
        textField.borderStyle = .roundedRect

        return textField
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5

        return button
    }()

    lazy var termsButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Terms and Conditions", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underline()

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .backgroundHome

        setUpSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubViews() {
        self.addSubview(notBoredLabel)
        setUpConstraintsNotBoredLabel()
        
        self.addSubview(participantsLabel)
        setUpConstraintsParticipantsLabel()
        
        self.addSubview(participantsTextField)
        setUpConstraintsParticipantsTextField()
        
        self.addSubview(priceLabel)
        setUpConstraintsPriceLabel()
        
        self.addSubview(priceTextField)
        setUpConstraintsPriceTextField()
        
        self.addSubview(termsButton)
        setUpConstraintsTermsButton()
        
        self.addSubview(startButton)
        setUpConstraintsStartButton()
    }
    
    private func setUpConstraintsNotBoredLabel() {
        NSLayoutConstraint.activate([
            notBoredLabel.topAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            notBoredLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            notBoredLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setUpConstraintsParticipantsLabel() {
        NSLayoutConstraint.activate([
            participantsLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            participantsLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setUpConstraintsParticipantsTextField() {
        NSLayoutConstraint.activate([
            participantsTextField.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -50),
            participantsTextField.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            participantsTextField.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            participantsLabel.bottomAnchor.constraint(equalTo: participantsTextField.topAnchor, constant: -8)
        ])
    }
    
    private func setUpConstraintsPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: participantsTextField.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor)
        ])
    }
    
    private func setUpConstraintsPriceTextField() {
        NSLayoutConstraint.activate([
            priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            priceTextField.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            priceTextField.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor)
        ])
    }
    
    private func setUpConstraintsStartButton() {
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -8)
        ])
    }
    
    private func setUpConstraintsTermsButton() {
        NSLayoutConstraint.activate([
            termsButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            termsButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            termsButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64)
        ])
    }
}
