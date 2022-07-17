//
//  HorizontalCollectionViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/15.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    static let identifier = "HorizontalCollectionViewCell"
    private let dummyData: [Extra] = [Extra(subtitle: "최대 15만원", mainTitle: "카드 혜택받기 ", imageName: "card"), Extra(subtitle: "요즘 인기", mainTitle: "오늘의 머니팁", imageName: "light"), Extra(subtitle: "집 있다면", mainTitle: "내 부동산 시세조회", imageName: "house"), Extra(subtitle: "인기", mainTitle: "더보기", imageName: "")]
    
    private let inquiryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(InquiryCollectionViewCell.self, forCellWithReuseIdentifier: InquiryCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func initView() {
        contentView.addSubview(inquiryCollectionView)
        inquiryCollectionView.frame = contentView.bounds
        inquiryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        inquiryCollectionView.delegate = self
        inquiryCollectionView.dataSource = self
        
        inquiryCollectionView.backgroundColor = .tossBackgroundColor
        let inquiryCollectionViewConstraints = [
            inquiryCollectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            inquiryCollectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            inquiryCollectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            inquiryCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(inquiryCollectionViewConstraints)
    }
    
}

extension HorizontalCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InquiryCollectionViewCell.identifier, for: indexPath) as? InquiryCollectionViewCell else {
            fatalError()
        }
        let model = dummyData[indexPath.row]
        cell.configure(with: InquiryViewModel(subtitle: model.subtitle, mainTitle: model.mainTitle, imageName: model.imageName))
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15.0
        return cell
    }
}
