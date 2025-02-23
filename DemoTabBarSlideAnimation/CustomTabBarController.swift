//
//  CustomTabBarController.swift
//  DemoTabBarSlideAnimation
//
//  Created by Lê Tiến Đạt on 23/2/25.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 2
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupIndicator()
    }

    private func setupIndicator() {
        guard let firstItem = tabBar.items?.first else { return }

        let tabBarItemWidth = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 2)
        let indicatorHeight: CGFloat = 4
        
        indicatorView.frame = CGRect(
            x: tabBarItemWidth * CGFloat(firstItem.tag),
            y: tabBar.bounds.height - indicatorHeight + 10,
            width: tabBarItemWidth,
            height: indicatorHeight
        )
        tabBar.addSubview(indicatorView)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame.origin.x = self.indicatorView.frame.width * CGFloat(item.tag)
        }
    }

}
