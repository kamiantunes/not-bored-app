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
    private var activity: Activity?

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
        verifyRandom()
    }

    private func setupCategorie() {
        guard let activityInformation = activityInformation,
              let label = activityInformation.categorie else { return }

        activityView.titleLabel.text = label
    }

    private func verifyCategorie() {
        guard let activityInformation = activityInformation else { return }

        if !activityInformation.isRandom {
            activityView.categorieIcon.isHidden = true
            activityView.categorieLabel.isHidden = true
        }
    }

    private func verifyRandom() {
        guard let activityInformation = activityInformation else { return }

        network.getActivy(url: activityInformation.url) { resultado in
            self.populateData(with: resultado)
        }
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
