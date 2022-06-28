//
//  CategoriesView.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import UIKit

final class CategoriesView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .backgroundHome
        
        return tableView
    }()

    private lazy var titleView: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBlue

        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "Activities"
        label.textAlignment = .center
        label.textColor = .black

        return label
    }()

    lazy var shuffleButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.setBackgroundImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .black

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .backgroundHome

        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpViews() {
        addSubview(titleView)
        setUpConstraintsTitleView()
        
        addSubview(tableView)
        setUpConstraintsTableView()
        
        titleView.addSubview(titleLabel)
        setUpConstraintsTitleLabel()
        
        titleView.addSubview(shuffleButton)
        setUpConstraintsShuffleButton()
        
    }
    
    private func setUpConstraintsTitleView() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80)
        ])
    }
    
    private func setUpConstraintsTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpConstraintsTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)
        ])
    }
    
    private func setUpConstraintsShuffleButton() {
        NSLayoutConstraint.activate([
            shuffleButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            shuffleButton.widthAnchor.constraint(equalToConstant: 26),
            shuffleButton.heightAnchor.constraint(equalToConstant: 26),
            shuffleButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
