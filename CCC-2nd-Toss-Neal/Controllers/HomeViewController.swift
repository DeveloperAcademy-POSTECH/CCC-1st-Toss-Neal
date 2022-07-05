//
//  HomeViewController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/03.
//

import UIKit

class HomeViewController: UIViewController {
    private let inquiryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
//        왜 zero를 해주는걸까?
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(InquiryCollectionViewCell.self, forCellWithReuseIdentifier: "inquiryCell")
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
        view.addSubview(inquiryCollectionView)
        inquiryCollectionView.delegate = self
        inquiryCollectionView.dataSource = self
        inquiryCollectionView.frame = view.bounds
        inquiryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        inquiryCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        inquiryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        inquiryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 3).isActive = true
        inquiryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        inquiryCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
        return dummyData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inquiryCell", for: indexPath) as? InquiryCollectionViewCell else {
            fatalError()
        }
        cell.configure(dummyData[indexPath.row])
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15.0
        return cell
    }
}
