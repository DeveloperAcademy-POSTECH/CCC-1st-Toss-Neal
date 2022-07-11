//
//  InquiryCollectionViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/05.
//

import UIKit

class InquiryCollectionViewCell: UICollectionViewCell {
    static let identifier = "InquiryCollectionViewCell"
    
    private let subTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lbl.textColor = .black.withAlphaComponent(0.6)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let mainTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    private let imageIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = .clear
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init error")
    }
    
    func initView() {
        self.contentView.backgroundColor = .clear
        
        [subTitle, mainTitle, imageIcon].forEach { view in
            self.contentView.addSubview(view)
        }
        
        subTitle.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 12))
        mainTitle.anchor(top: subTitle.safeAreaLayoutGuide.bottomAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 40))
        imageIcon.anchor(top: nil, right: contentView.safeAreaLayoutGuide.rightAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, left: nil, padding: .init(top: 0, left: 0, bottom: 20, right: 20), size: .init(width: 30, height: 30))
    }
    
    func configure(with data: InquiryViewModel) {
        self.subTitle.text = data.subtitle
        self.mainTitle.text = data.mainTitle
        if !data.imageName.isEmpty {
            self.imageIcon.image = UIImage(named: data.imageName)
        }
    }

}
