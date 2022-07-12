//
//  AssetCollectionViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/12.
//

import UIKit

//class AssetCollectionViewCell: UICollectionViewCell {
//    static let identifier = "AssetCollectionViewCell"
//    private let assetTable: UITableView = {
//        let table = UITableView(frame: .zero, style: .plain)
//        table.register(AssetTableViewCell.self, forCellReuseIdentifier: AssetTableViewCell.identifier)
//        return table
//    }()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initView()
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    func initView() {
//        self.contentView.backgroundColor = .clear
//        self.addSubview(assetTable)
//        assetTable.frame = contentView.bounds
//        assetTable.layer.cornerRadius = 15
//
//        assetTable.dataSource = self
//        assetTable.delegate = self
//    }
//}
//
//extension AssetCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: AssetTableViewCell.identifier, for: indexPath) as? AssetTableViewCell else {
//            return UITableViewCell()
//        }
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//}
//

class AssetCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "assetCollectionViewCell"
    private let assetTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(AssetTableViewCell.self, forCellReuseIdentifier: AssetTableViewCell.identifier)
        return table
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
        self.contentView.addSubview(assetTable)
        assetTable.frame = contentView.bounds
        assetTable.layer.cornerRadius = 15
    }
}

extension AssetCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AssetTableViewCell.identifier, for: indexPath) as? AssetTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "1111"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
