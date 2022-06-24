//
//  InitialViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 17/06/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        HomeView(frame: .zero)
    }()
    
    weak var delegate: CategoriesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pin(homeView, to: self)
        
        addActions()
    }

    private func addActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        // participantsTextField
        homeView.participantsTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        homeView.participantsTextField.delegate = self
        
        // priceTextField
        homeView.priceTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        homeView.priceTextField.delegate = self

        // startButton
        homeView.startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        // termsButton
        homeView.termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
    }

    @objc private func dismissKeyboard () {
        view.endEditing(true)
    }

    @objc private func didTapStart() {
        let viewController = CategoriesViewController()
        var home = Home()

        if let participants = homeView.participantsTextField.text, !participants.isEmpty {
            home.numberOfParticipants = Int(participants) ?? 0
        }
        
        if let price = homeView.priceTextField.text, !price.isEmpty {
            home.price = Double(price) ?? -1
        }

        self.delegate = viewController
        delegate?.addHomeInput(home: home)

        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func didTapTerms() {
        let vc = TermsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let textParticipants = homeView.participantsTextField.text,
              let textPrice = homeView.priceTextField.text else { return }
        
        let participants = Int(textParticipants) ?? 0
        let participantsCondition = participants > 0 || textParticipants.isEmpty
        
        let price: Double = textPrice.isEmpty ? -1 : Double(textPrice) ?? 2
        let priceCondition = price >= 0 && price <= 1 || price < 0

        verifyButton(priceCondition, participantsCondition)
    }
    
    private func verifyButton(_ priceCondition: Bool, _ participantsCondition: Bool) {
        homeView.startButton.isEnabled = priceCondition && participantsCondition
        
        homeView.startButton.backgroundColor = homeView.startButton.isEnabled ? .systemBlue : .gray
    }
}
