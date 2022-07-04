//
//  Color+Extension.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/05.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
       }

       convenience init(rgb: Int) {
           self.init(
               red: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF
           )
       }
//    convenience init(red: Int, green: Int, blue: Int) {
//           assert(red >= 0 && red <= 255, "Invalid red component")
//           assert(green >= 0 && green <= 255, "Invalid green component")
//           assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//       }
//    convenience init(rgb: Int) {
//        self.init(red: CGFloat((rgb >> 16) & 0xFF), green: CGFloat((rgb >> 8) & 0xFF), blue: CGFloat(rgb & 0xFF), alpha: 1)
//    }
    static let tossBackgroundColor = UIColor(rgb: 0xF2F3F5)
    static let tossTintColor = UIColor(rgb: 0xAEB7C2)
}
