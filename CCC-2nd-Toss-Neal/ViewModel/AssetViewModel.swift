//
//  File.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/12.
//

import Foundation
let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter
}()

struct AssetViewModel {
    var imageName: String
    var assetType: String
    var deposit: Int
    var depositText: String {
        guard let text = numberFormatter.string(from: NSNumber(value: deposit)) else {
            return ""
        }
        return "\(text)원"
    }
    var buttonStyle: String
}
