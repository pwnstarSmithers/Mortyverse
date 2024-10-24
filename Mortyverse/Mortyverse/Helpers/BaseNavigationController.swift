//
//  BaseNavigationController.swift
//  Mortyverse
//
//  Created by Mugalu on 09/09/2024.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppearance()
    }

    private func setupNavigationBarAppearance() {
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
//
//        navigationBar.tintColor = .eazzyTextMain
//        navigationBar.backIndicatorImage = Asset.backArrow.image
//        navigationBar.backIndicatorTransitionMaskImage = Asset.backArrow.image
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        removeBackButtonTitle(for: viewController)
        super.pushViewController(viewController, animated: animated)
    }

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        viewControllers.forEach(removeBackButtonTitle(for:))
        super.setViewControllers(viewControllers, animated: animated)
    }

    private func removeBackButtonTitle(for viewController: UIViewController) {
        if #available(iOS 14.0, *) {
            viewController.navigationItem.backButtonDisplayMode = .minimal
        } else {
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        }
    }
}
