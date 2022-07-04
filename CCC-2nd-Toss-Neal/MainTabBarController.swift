//
//  MainTabBarController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/06/30.
//

import UIKit

// final class로 지정함으로써 다시는 상속받거나 변하지 않기 떄문에 final로 해주는게 좋다. 
final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: BenefitViewController())
        let vc3 = UINavigationController(rootViewController: TransferViewController())
        let vc4 = UINavigationController(rootViewController: StockViewController())
        let vc5 = UINavigationController(rootViewController: TotalViewController())
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.title = "홈"
        vc2.tabBarItem.image = UIImage(systemName: "pentagon.fill")?.withHorizontallyFlippedOrientation()
        vc2.tabBarItem.title = "혜택"
        vc3.tabBarItem.image = UIImage(systemName: "dollarsign.circle.fill")
        vc3.tabBarItem.title = "송금"
        vc4.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        vc4.tabBarItem.title = "주식"
        vc5.tabBarItem.image = UIImage(systemName: "line.3.horizontal")
        vc5.tabBarItem.title = "전체"
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
}
