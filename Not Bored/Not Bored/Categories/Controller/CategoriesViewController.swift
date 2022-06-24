//
//  ListCategoriesViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

final class CategoriesViewController: UIViewController {

    weak var delegate: ActivityViewControllerDelegate?

    private let network = Network()

    private lazy var categoriesView: CategoriesView = {
        CategoriesView(frame: .zero)
    }()

    var homeInput: Home?

    private let categories: [String] = [
        "Education",
        "Recreational",
        "Social",
        "Diy",
        "Charity",
        "Cooking",
        "Relaxation",
        "Music",
        "Busywork"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        pin(categoriesView, to: self)

        setupTableView()
        addActions()
    }

    private func addActions() {
        categoriesView.shuffleButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        let categoryName = "Random"
        let url = makeURLRandom()
        let activityInformation = ActivityInformation(categorie: categoryName, homeInput: homeInput, isRandom: true, url: url)
        let vc = ActivityViewController()


        self.delegate = vc
        delegate?.addInformations(with: activityInformation)

        network.getActivy(url: url) {resultado in
            vc.populateData(with: resultado)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func setupTableView() {
        categoriesView.tableview.delegate = self
        categoriesView.tableview.dataSource = self

        categoriesView.tableview.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseId)
    }

    private func makeURLRandom() -> String {
        guard let homeInput = homeInput else { return String() }

        let url: String?

        if homeInput.hasParticipants{
            url = .urlRandomParticipantsActivity + "\(homeInput.numberOfParticipants)"
        } else {
            url = .urlRandomActivity
        }

        return url ?? ""
    }

    private func makeURLCategories(for category: String) -> String {
        guard let homeInput = homeInput else { return String() }

        var url = .urlCategorieActivity + category.lowercased()

        if homeInput.hasParticipants {
            url += .parameterParticipants + "\(homeInput.numberOfParticipants)"
        }

        return url
    }
}

extension CategoriesViewController: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoriesTableViewCell.reuseId, for: indexPath) as? CategoriesTableViewCell

        let categories = categories[indexPath.row]
        cell?.set(with: categories)

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let url = makeURLCategories(for: category)
        let activityInformation = ActivityInformation(categorie: category, homeInput: homeInput, isRandom: false, url: url)
        let vc = ActivityViewController()

        self.delegate = vc
        delegate?.addInformations(with: activityInformation)

        network.getActivy(url: url) {resultado in
            vc.populateData(with: resultado)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

protocol CategoriesViewControllerDelegate: AnyObject {
    func addHomeInput(home: Home)
}

extension CategoriesViewController: CategoriesViewControllerDelegate {
    func addHomeInput(home: Home) {
        self.homeInput = home
    }
}
