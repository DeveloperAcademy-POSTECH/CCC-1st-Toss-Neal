//
//  HomeViewController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/03.
//

import UIKit

class HomeViewController: UIViewController {
    private let assetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 360, height: 360)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AssetCollectionViewCell.self, forCellWithReuseIdentifier: AssetCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return collectionView
    }()
    private let inquiryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
//        왜 zero를 해주는걸까?
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(InquiryCollectionViewCell.self, forCellWithReuseIdentifier: "inquiryCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tossBackgroundColor
        setupMainLayout()
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
        assetCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        assetCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        assetCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        assetCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        assetCollectionView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        assetCollectionView.layer.cornerRadius = 15.0
        assetCollectionView.backgroundColor = .tossBackgroundColor
        inquiryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        inquiryCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        inquiryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        inquiryCollectionView.topAnchor.constraint(equalTo: assetCollectionView.bottomAnchor, constant: 20).isActive = true
        inquiryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        inquiryCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        inquiryCollectionView.backgroundColor = .tossBackgroundColor
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
        } else {
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.inquiryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inquiryCell", for: indexPath) as? InquiryCollectionViewCell else {
                fatalError()
            }
            cell.configure(dummyData[indexPath.row])
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
