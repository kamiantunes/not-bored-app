//
//  TermsView.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import UIKit

final class TermsView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Terms and Conditions"
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()

    private lazy var notBoredLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Not Bored"
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center

        return label
    }()

    private let textViewText: String = "Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec fermentum sed dictum laoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubilia senectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet, semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et eget pretium volutpat eu dictum dictumst. \n\nPraesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctor ullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncus mauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringilla ad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet mauris leo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostra quam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis. \n\nDignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdum commodo montes convallis curae facilisis. Vitae diam phasellus litora ad aenean himenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis. \n\nNisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per, tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque."

    private lazy var textLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = textViewText
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .backgroundHome

        setUpSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubViews() {
        addSubview(scrollView)
        setUpConstraintScrollView()
        
        scrollView.addSubview(contentView)
        setUpConstraintContentView()
        
        contentView.addSubview(titleLabel)
        setUpConstraintTitleLabel()
        
        contentView.addSubview(notBoredLabel)
        setUpConstraintNotBoredLabel()
        
        contentView.addSubview(textLabel)
        setUpConstraintTextLabel()
    }
    
    private func setUpConstraintScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setUpConstraintContentView() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setUpConstraintTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setUpConstraintNotBoredLabel() {
        NSLayoutConstraint.activate([
            notBoredLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            notBoredLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            notBoredLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }
    
    private func setUpConstraintTextLabel() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: notBoredLabel.bottomAnchor, constant: 25),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
