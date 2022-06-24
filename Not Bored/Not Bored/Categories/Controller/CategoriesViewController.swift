//
//  ListCategoriesViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

final class CategoriesViewController: UIViewController {
    
    private lazy var categoriesView: CategoriesView = {
        CategoriesView(frame: .zero)
    }()

    weak var delegate: ActivityViewControllerDelegate?
    
    private let network = Network()
    private var homeInput: Home?

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

        setUpTableView()
        addActions()
    }

    private func addActions() {
        categoriesView.shuffleButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        let categoryName = "Random"
        let viewController = ActivityViewController()
        
        let url = network.makeURL(isRandom: true,
                                  category: nil,
                                  hasParticipants: homeInput?.hasParticipants ?? false ,
                                  participants: homeInput?.numberOfParticipants ?? 0,
                                  hasPrice: homeInput?.hasPrice ?? false,
                                  price: homeInput?.price ?? 0)
        
        let activityInformation = ActivityInformation(categorie: categoryName,
                                                      homeInput: homeInput,
                                                      isRandom: true,
                                                      url: url)
    
        self.delegate = viewController
        delegate?.addInformations(with: activityInformation)

        requisition(using: url, to: viewController)
    }
    
    private func makeAndPresentAlert() {
        let message = "There are no activities with these parameters"
        let title = "Activity not found!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    private func setUpTableView() {
        categoriesView.tableView.delegate = self
        categoriesView.tableView.dataSource = self

        categoriesView.tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseId)
    }
    
    private func requisition(using url: String, to viewController: ActivityViewController) {
        network.getActivy(url: url) {response, error in
            if let response = response {
                viewController.populateData(with: response)
                self.navigationController?.pushViewController(viewController, animated: true)
            } else if error != nil {
                self.makeAndPresentAlert()
            }
        }
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
        let viewController = ActivityViewController()
        
        let url = network.makeURL(isRandom: false,
                                  category: category,
                                  hasParticipants: homeInput?.hasParticipants ?? false ,
                                  participants: homeInput?.numberOfParticipants ?? 0,
                                  hasPrice: homeInput?.hasPrice ?? false,
                                  price: homeInput?.price ?? 0)
        
        let activityInformation = ActivityInformation(categorie: category,
                                                      homeInput: homeInput,
                                                      isRandom: false,
                                                      url: url)

        self.delegate = viewController
        delegate?.addInformations(with: activityInformation)

        requisition(using: url, to: viewController)
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
