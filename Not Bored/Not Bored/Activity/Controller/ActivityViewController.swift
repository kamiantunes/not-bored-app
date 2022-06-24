//
//  SugestionViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    lazy var activityView: ActivityView = {
        ActivityView(frame: .zero)
    }()

    private let network = Network()
    private var activityInformation: ActivityInformation?

    override func viewDidLoad() {
        super.viewDidLoad()

        pin(activityView, to: self)

        addActions()
        setupCategorie()
        verifyCategorie()
    }

    private func addActions() {
        activityView.backButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        activityView.nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func didTapNextButton() {
        requisition()
    }

    private func setupCategorie() {
        guard let activityInformation = activityInformation,
              let label = activityInformation.categorie else { return }

        activityView.titleLabel.text = label
    }

    private func verifyCategorie() {
        guard let activityInformation = activityInformation else { return }

        if !activityInformation.isRandom {
            activityView.categorieImageView.isHidden = true
            activityView.categorieLabel.isHidden = true
        }
    }

    private func requisition() {
        guard let activityInformation = activityInformation else { return }

        network.getActivy(url: activityInformation.url) { resultado, error in
            if let resultado = resultado {
                self.populateData(with: resultado)
            } else if error != nil {
                self.makeAndPresentAlert()
            }
        }
    }
    
    private func makeAndPresentAlert() {
        let message = "There are no activities with these parameters"
        let title = "Activity not found!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    func populateData(with activity: Activity) {
        activityView.activityLabel.text = activity.activity
        activityView.participantsNumberLabel.text = String(activity.participants)
        activityView.priceRangeLabel.text = activity.priceDescription
        activityView.categorieLabel.text = activity.type.capitalized
    }
}

protocol ActivityViewControllerDelegate: AnyObject {
    func addInformations(with activityInformation: ActivityInformation)
}

extension ActivityViewController: ActivityViewControllerDelegate {
    func addInformations(with activityInformation: ActivityInformation) {
        self.activityInformation = activityInformation
    }
}
