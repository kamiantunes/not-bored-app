//
//  ListCategoriesViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

class ListCategoriesViewController: UIViewController {

    private lazy var categories: [String] = [
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

    let tableview: UITableView = {
        let tv = UITableView()

        tv.backgroundColor = .backgroundHome
        tv.translatesAutoresizingMaskIntoConstraints = false

        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .backgroundHome
        configureNavBar()
        setupTableView()
    }

    func configureNavBar() {
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "shuffle"),
            style: .done,
            target: self,
            action: #selector(didTapButton))

        navigationItem.rightBarButtonItem?.tintColor = .label

        navigationItem.title = "Activities"
    }

    @objc func didTapButton() {
        let vc = SugestionViewController()

        navigationController?.pushViewController(vc, animated: true)
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self

        tableview.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "CategoriesTableViewCell")

        view.addSubview(tableview)

        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension ListCategoriesViewController: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as? CategoriesTableViewCell

        let categories = categories[indexPath.row]
        cell?.set(with: categories)

        cell?.cellButton.addTarget(cell?.cellButton, action: #selector(didTapCell), for: .touchUpInside)

        return cell ?? UITableViewCell()
    }

    @objc func didTapCell() {
        let vc = SugestionViewController()

        navigationController?.pushViewController(vc, animated: true)
    }
}


