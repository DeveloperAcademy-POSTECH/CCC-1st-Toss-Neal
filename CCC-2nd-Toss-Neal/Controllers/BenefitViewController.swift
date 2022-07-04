//
//  BenefitViewController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/03.
//

import UIKit

class BenefitViewController: UIViewController {
    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "혜택"
        textLabel.textAlignment = .center
        return textLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainLayout()
    }
    private func setupMainLayout() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 3).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
