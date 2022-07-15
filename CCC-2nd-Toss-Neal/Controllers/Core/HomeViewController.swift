//
//  HomeViewController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/03.
//

import UIKit

// TODO: Depoble

class HomeViewController: UIViewController {
    private let dummyData: [Extra] = [Extra(subtitle: "최대 15만원", mainTitle: "카드 혜택받기 ", imageName: "card"), Extra(subtitle: "요즘 인기", mainTitle: "오늘의 머니팁", imageName: "light"), Extra(subtitle: "집 있다면", mainTitle: "내 부동산 시세조회", imageName: "house"), Extra(subtitle: "인기", mainTitle: "더보기", imageName: "")]
    
    private let dummyString: [String] = ["123", "456", "789"]
    private let assetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 360, height: 240)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AssetCollectionViewCell.self, forCellWithReuseIdentifier: AssetCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return collectionView
    }()
    
    private let inquiryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(InquiryCollectionViewCell.self, forCellWithReuseIdentifier: InquiryCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
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
        view.addSubview(inquiryCollectionView)

        assetCollectionView.delegate = self
        assetCollectionView.dataSource = self
        inquiryCollectionView.delegate = self
        inquiryCollectionView.dataSource = self
        assetCollectionView.frame = view.bounds
        inquiryCollectionView.frame = view.bounds
        
        assetCollectionView.translatesAutoresizingMaskIntoConstraints = false
        assetCollectionView.layer.cornerRadius = 15.0
        assetCollectionView.backgroundColor = .tossBackgroundColor
        
        let assetCollectionViewConstraints = [
            assetCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            assetCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            assetCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            assetCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            assetCollectionView.heightAnchor.constraint(equalTo: assetCollectionView.widthAnchor)
        ]
        
        inquiryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        inquiryCollectionView.backgroundColor = .tossBackgroundColor
        let inquiryCollectionViewConstraints = [
            inquiryCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            inquiryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            inquiryCollectionView.topAnchor.constraint(equalTo: assetCollectionView.bottomAnchor, constant: 20),
            inquiryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            inquiryCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(inquiryCollectionViewConstraints)
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
        if collectionView == self.inquiryCollectionView {
            return dummyData.count
        }
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.inquiryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InquiryCollectionViewCell.identifier, for: indexPath) as? InquiryCollectionViewCell else {
                fatalError()
            }
            let model = dummyData[indexPath.row]
            cell.configure(with: InquiryViewModel(subtitle: model.subtitle, mainTitle: model.mainTitle, imageName: model.imageName))
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 15.0
            return cell
        } else if collectionView == self.assetCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssetCollectionViewCell.identifier, for: indexPath) as? AssetCollectionViewCell else {
                fatalError()
            }
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 15
            return cell
        }
        return UICollectionViewCell()
    }
}
