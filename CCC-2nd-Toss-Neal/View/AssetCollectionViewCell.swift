//
//  AssetCollectionViewCell.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/12.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
    static let identifier = "AssetCollectionViewCell"
    let dummyAsset: [Asset] = [Asset(imageName: "shinhan_symbol", assetType: "신한은행 계좌", deposit: 20024132, buttonStyle: "송금"), Asset(imageName: "shinhan_symbol", assetType: "저축예금", deposit: 20202020322, buttonStyle: "송금")]
    
    private let assetTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(AssetTableViewCell.self, forCellReuseIdentifier: AssetTableViewCell.identifier)
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func initView() {
        self.contentView.backgroundColor = .clear
        self.addSubview(assetTable)
        setAssetTable()
    }
    private func setAssetTable() {
        assetTable.frame = contentView.bounds
        assetTable.layer.cornerRadius = 15
        assetTable.separatorStyle = .none
        
        assetTable.dataSource = self
        assetTable.delegate = self
        
        assetTable.translatesAutoresizingMaskIntoConstraints = false
        
        let assetTableConstraint = [
            assetTable.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            assetTable.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            assetTable.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            assetTable.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(assetTableConstraint)
    }
}

extension AssetCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAsset.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AssetTableViewCell.identifier, for: indexPath) as? AssetTableViewCell else {
            return UITableViewCell()
        }
        
        let asset = dummyAsset[indexPath.row]
        let model = AssetViewModel(imageName: asset.imageName, assetType: asset.assetType, deposit: asset.deposit, buttonStyle: asset.buttonStyle)
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
