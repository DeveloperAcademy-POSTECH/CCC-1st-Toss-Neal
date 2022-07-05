//
//  InquiryCollectionViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/05.
//

import UIKit

class InquiryCollectionViewCell: UICollectionViewCell {
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
        for item in [subTitle, mainTitle, imageIcon] {
            self.contentView.addSubview(item)
        }
        subTitle.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 12))
        mainTitle.anchor(top: subTitle.safeAreaLayoutGuide.bottomAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 40))
        imageIcon.anchor(top: mainTitle.bottomAnchor, right: contentView.safeAreaLayoutGuide.rightAnchor, bottom: nil, left: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 20), size: .init(width: 30, height: 30))
    }
    func configure(_ data: CellData) {
        self.subTitle.text = data.subtitle
        self.mainTitle.text = data.mainTitle
        if !data.imageName.isEmpty {
        self.imageIcon.image = UIImage(named: data.imageName)
        }
    }

}
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
