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
        let tf = UITextField()

        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect

        return tf
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
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubViews() {
        self.addSubview(notBoredLabel)
        self.addSubview(participantsLabel)
        self.addSubview(participantsTextField)
        self.addSubview(startButton)
        self.addSubview(termsButton)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            // notBoredLabel
            notBoredLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 76),
            notBoredLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            notBoredLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            // participantsLabel
            participantsLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            participantsLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            participantsLabel.bottomAnchor.constraint(equalTo: participantsTextField.topAnchor, constant: -8),

            // participantsTextField
            participantsTextField.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            participantsTextField.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            participantsTextField.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),

            // startButton
            startButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -8),

            // termsButton
            termsButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            termsButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            termsButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64)
        ])
    }
}
