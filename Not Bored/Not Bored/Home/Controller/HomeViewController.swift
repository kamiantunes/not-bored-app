//
//  InitialViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 17/06/22.
//

import UIKit

final class HomeViewController: UIViewController {

    weak var delegate: CategoriesViewControllerDelegate?

    private lazy var homeView: HomeView = {
        HomeView(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        pin(homeView, to: self)

        addActions()
    }

    private func addActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        // participantsTextField
        homeView.participantsTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        homeView.participantsTextField.delegate = self

        // startButton
        homeView.startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        // termsButton
        homeView.termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
    }

    @objc private func dismissKeyboard () {
        view.endEditing(true)
    }

    @objc func didTapStart() {
        let vc = CategoriesViewController()
        var home = Home()

        if let participants = homeView.participantsTextField.text, !participants.isEmpty {
            home.numberOfParticipants = Int(participants) ?? 0
        }

        self.delegate = vc
        delegate?.addHomeInput(home: home)

        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapTerms() {
        let vc = TermsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let textParticipants = homeView.participantsTextField.text else { return }

        homeView.startButton.isEnabled = Int(textParticipants) ?? 0 > 0 || textParticipants.isEmpty

        if homeView.startButton.isEnabled {
            homeView.startButton.backgroundColor = .systemBlue
        } else {
            homeView.startButton.backgroundColor = .gray
        }
    }
}
