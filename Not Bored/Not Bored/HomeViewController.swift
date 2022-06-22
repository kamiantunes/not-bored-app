//
//  InitialViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 17/06/22.
//

import UIKit

class HomeViewController: UIViewController {

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

    private lazy var participantsTextField: UITextField = {
        let tf = UITextField()

        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf.delegate = self

        return tf
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        return button
    }()

    private lazy var termsButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and Conditions", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .none
        button.underline()
        button.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundHome
        setUpSubViews()
        setUpConstraints()
    }

    @objc func didTapStart() {
        guard let participants = participantsTextField.text else { return }

        print(Int(participants) ?? 0)

        let vc = ListCategoriesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapTerms() {
        let vc = TermsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setUpSubViews() {
        view.addSubview(notBoredLabel)
        view.addSubview(participantsLabel)
        view.addSubview(participantsTextField)
        view.addSubview(startButton)
        view.addSubview(termsButton)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            // notBoredLabel
            notBoredLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76),
            notBoredLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            notBoredLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

            // participantsLabel
            participantsLabel.bottomAnchor.constraint(equalTo: participantsTextField.topAnchor, constant: -8),
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            // participantsTextField
            participantsTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            participantsTextField.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            participantsTextField.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),

            // startButton
            startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -8),
            startButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),

            // termsButton
            termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            termsButton.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            termsButton.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor)
        ])
    }
}

extension HomeViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {

        guard let textParticipants = participantsTextField.text else { return }

        startButton.isEnabled = Int(textParticipants) ?? 0 > 0

        if startButton.isEnabled {
            startButton.backgroundColor = .systemBlue
        } else {
            startButton.backgroundColor = .gray
        }
    }
}
