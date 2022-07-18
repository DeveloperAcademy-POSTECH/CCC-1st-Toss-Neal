//
//  MainTabBarController.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/06/30.
//

import UIKit

// final class로 지정함으로써 다시는 상속받거나 변하지 않기 떄문에 final로 해주는게 좋다. 
final class MainTabBarController: UITabBarController {
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())

    private let benefitViewController = UINavigationController(rootViewController: BenefitViewController())

    private let transferViewController = UINavigationController(rootViewController: TransferViewController())

    private let stockViewController = UINavigationController(rootViewController: StockViewController())

    private let totalViewController = UINavigationController(rootViewController: TotalViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbarShape()
        setViewItems()
        setViewControllers([homeViewController, benefitViewController, transferViewController, stockViewController, totalViewController], animated: true)
    }
    
    private func setViewItems() {
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.title = "홈"
        
        benefitViewController.tabBarItem.image = UIImage(systemName: "pentagon.fill")?.withHorizontallyFlippedOrientation()
        benefitViewController.tabBarItem.title = "혜택"
        
        transferViewController.tabBarItem.image = UIImage(systemName: "dollarsign.circle.fill")
        transferViewController.tabBarItem.title = "송금"
        
        stockViewController.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        stockViewController.tabBarItem.title = "주식"
        totalViewController.tabBarItem.image = UIImage(systemName: "line.3.horizontal")
        totalViewController.tabBarItem.title = "전체"
    }
    
    private func setTabbarShape() {
        view.backgroundColor = .tossBackgroundColor
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        
//        Tabbar reverse corner radius
//        https://stackoverflow.com/questions/61440924/how-can-i-create-a-rounded-tab-with-swift
//      TODO: maskedCorners에 대해서 공부하기
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
