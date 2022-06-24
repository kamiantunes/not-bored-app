//
//  CategoriesView.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import UIKit

final class CategoriesView: UIView {

    lazy var tableview: UITableView = {
        let tv = UITableView()

        tv.backgroundColor = .backgroundHome
        tv.translatesAutoresizingMaskIntoConstraints = false

        return tv
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

        setupViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        titleView.addSubview(shuffleButton)
        titleView.addSubview(titleLabel)

        self.addSubview(titleView)
        self.addSubview(tableview)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),

            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),

            shuffleButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            shuffleButton.widthAnchor.constraint(equalToConstant: 26),
            shuffleButton.heightAnchor.constraint(equalToConstant: 26),
            shuffleButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            tableview.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
}
