//
//  LabelView.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/12.
//

import UIKit

class LabelView: UIView {
    private let bankTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "UIVIew"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .light)
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let cashLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "UIView"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setLabelConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setLabelConstraint() {
        [bankTypeLabel, cashLabel].forEach { label in
            addSubview(label)
        }
        
        let bankTypeLabelConstraints = [
            bankTypeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            bankTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bankTypeLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ]
        
        let cashLabelConstraints = [
            cashLabel.topAnchor.constraint(equalTo: bankTypeLabel.bottomAnchor, constant: 10),
            cashLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            cashLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(bankTypeLabelConstraints)
        NSLayoutConstraint.activate(cashLabelConstraints)
    }
    
//    override func draw(_ rect: CGRect) {
//    }
//
}
