//
//  AssetTableViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/12.
//

import UIKit

// TODO: Title, 및, 데이터

class AssetTableViewCell: UITableViewCell {
    static let identifier = "AssetTableViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let bankTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let cashLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    private let figureButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.gray()
        config.titlePadding = 10.0
        config.baseForegroundColor = .black.withAlphaComponent(0.9)
        config.buttonSize = .medium
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayoutConstraints() {
        [posterImageView, bankTypeLabel, cashLabel, figureButton].forEach { view in
            self.contentView.addSubview(view)
        }
        
        let posterImageViewConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 48)
        ]
        
        let bankTypeLabelConstraints = [
            bankTypeLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            bankTypeLabel.trailingAnchor.constraint(equalTo: figureButton.leadingAnchor, constant: -30),
            bankTypeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let cashLabelConstraints = [
            cashLabel.leadingAnchor.constraint(equalTo: bankTypeLabel.leadingAnchor),
            cashLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]

        let figureButtonConstraints = [
            figureButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            figureButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(posterImageViewConstraints)
        NSLayoutConstraint.activate(bankTypeLabelConstraints)
        NSLayoutConstraint.activate(cashLabelConstraints)
        NSLayoutConstraint.activate(figureButtonConstraints)
    }
    
    func configure(with model: AssetViewModel) {
        posterImageView.image = UIImage(named: model.imageName)
        bankTypeLabel.text = model.assetType
        cashLabel.text = model.depositText
        figureButton.setTitle(model.buttonStyle, for: .normal)
        figureButton.isHidden = false
    }
}
