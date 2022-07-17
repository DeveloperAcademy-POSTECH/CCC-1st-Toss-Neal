//
//  HomeViewController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/03.
//

import UIKit

// TODO: Depoble

enum Sections: Int {
    case Asset = 0
    case Inquiry = 1
}

class HomeViewController: UIViewController {
    private let dummyData: [Extra] = [Extra(subtitle: "최대 15만원", mainTitle: "카드 혜택받기 ", imageName: "card"), Extra(subtitle: "요즘 인기", mainTitle: "오늘의 머니팁", imageName: "light"), Extra(subtitle: "집 있다면", mainTitle: "내 부동산 시세조회", imageName: "house"), Extra(subtitle: "인기", mainTitle: "더보기", imageName: "")]
    
    private let dummyString: [String] = ["123", "456", "789"]
    
    private let sectionTitles: [String] = ["자산", "조회"]
    
    private let assetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AssetCollectionViewCell.self, forCellWithReuseIdentifier: AssetCollectionViewCell.identifier)
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        setupMainLayout()
        setupNavigationItem()
    }
    
    private func setupColor() {
        self.view.backgroundColor = .tossBackgroundColor
    }
    
    private func setupNavigationItem() {
        self.navigationItem.leftBarButtonItem = makeleftBaritem()
        self.navigationItem.rightBarButtonItems = makeRightBaritems()
    }
    
    private func setupMainLayout() {
        view.addSubview(assetCollectionView)
//        view.addSubview(inquiryCollectionView)

        assetCollectionView.delegate = self
        assetCollectionView.dataSource = self
        assetCollectionView.frame = view.bounds
        
        assetCollectionView.translatesAutoresizingMaskIntoConstraints = false
        assetCollectionView.layer.cornerRadius = 15.0
        assetCollectionView.backgroundColor = .tossBackgroundColor
        
        let assetCollectionViewConstraints = [
            assetCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            assetCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            assetCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            assetCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            assetCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(assetCollectionViewConstraints)
    }
}

extension HomeViewController {
    private func makeleftBaritem() -> UIBarButtonItem {
        let tossLeftTitle: UIBarButtonItem = {
            let button = UIButton()
            var config = UIButton.Configuration.plain()
            config.title = "toss"
            config.baseForegroundColor = .tossTintColor
            config.image = UIImage.init(systemName: "dollarsign.circle.fill")
            config.imagePlacement = .leading
            button.configuration = config
            let item = UIBarButtonItem(customView: button)
            return item
        }()
        
        return tossLeftTitle
    }
    
    private func makeRightBaritems() -> [UIBarButtonItem] {
        let addButton: UIBarButtonItem = {
            let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed(_:)))
            button.tintColor = .tossTintColor
            return button
        }()
        
        let bellButton: UIBarButtonItem = {
            let imgIcon = UIImage(systemName: "bell.fill")
            let button = UIBarButtonItem(image: imgIcon, style: .plain, target: self, action: #selector(buttonPressed(_:)))
            button.tintColor = .tossTintColor
            return button
        }()
        
        let chatButton: UIBarButtonItem = {
            let imgIcon = UIImage(systemName: "message.fill")
            let button = UIBarButtonItem(image: imgIcon, style: .plain, target: self, action: #selector(buttonPressed(_:)))
            button.tintColor = .tossTintColor
            return button
        }()
        
        return [bellButton, chatButton, addButton]
    }
    
    @objc private func buttonPressed(_ sender: Any) {
        print("Button pressed")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case Sections.Asset.rawValue:
            return 3
        default:
            return 1
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case Sections.Asset.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssetCollectionViewCell.identifier, for: indexPath) as? AssetCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 15
            return cell
        case Sections.Inquiry.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath) as? HorizontalCollectionViewCell else {
                            fatalError()
                        }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case Sections.Asset.rawValue:
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        case Sections.Inquiry.rawValue:
            return UIEdgeInsets(top: 0, left: 10, bottom: 20, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case Sections.Asset.rawValue:
            return CGSize(width: 360, height: 240)
        case Sections.Inquiry.rawValue:
            return CGSize(width: collectionView.bounds.width, height: 140)
        default:
            return CGSize(width: 360, height: 240)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
