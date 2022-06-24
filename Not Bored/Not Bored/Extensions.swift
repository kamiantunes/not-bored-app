//
//  Extensions.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 17/06/22.
//

import UIKit

extension UIButton {
    func underline() {
        if let textString = self.titleLabel?.text {

            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }

    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

    static let backgroundHome = UIColor.init(hex: 0xD4F4FF)
}

extension String {
    static let urlRandomActivity = "http://www.boredapi.com/api/activity"
    static let urlRandomParticipantsActivity = "http://www.boredapi.com/api/activity?participants="
    static let urlRandomPriceActivity = "http://www.boredapi.com/api/activity?price="
    static let urlCategorieActivity = "http://www.boredapi.com/api/activity?type="
    static let parameterParticipants = "&participants="
    static let parameterPrice = "&price="
}


func pin(_ view: UIView, to navigation: UIViewController) {
    view.translatesAutoresizingMaskIntoConstraints = false

    navigation.view.addSubview(view)

    NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalTo: navigation.view.topAnchor),
        view.leadingAnchor.constraint(equalTo: navigation.view.leadingAnchor),
        view.centerYAnchor.constraint(equalTo: navigation.view.centerYAnchor),
        view.trailingAnchor.constraint(equalTo: navigation.view.trailingAnchor)
    ])
}
