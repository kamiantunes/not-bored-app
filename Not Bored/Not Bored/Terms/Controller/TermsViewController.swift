//
//  TermsViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 17/06/22.
//

import UIKit

final class TermsViewController: UIViewController {

    private lazy var termsView: TermsView = {
        TermsView(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        pin(termsView, to: self)
        configureNavBar()
    }

    private func configureNavBar() {
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .done,
            target: self,
            action: #selector(didTapButton))

        navigationItem.rightBarButtonItem?.tintColor = .label
    }

    @objc private func didTapButton () {
        navigationController?.popViewController(animated: true)
    }
}
