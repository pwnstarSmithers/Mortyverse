//
//  HomeCoordinator.swift
//  Mortyverse
//
//  Created by Mugalu on 09/09/2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override init(parentCoordinator: Coordinator?) {
        super.init(parentCoordinator: parentCoordinator)
    }
    
//    func primaryViewController() -> HomeViewController {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        let model = HomeViewModel(count: 1)
//        controller.viewModel = model
//        return controller
//    }
    
    override func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let model = HomeViewModel(count: 1)
        controller.viewModel = model
        navigationController?.pushViewController(controller, animated: true)
    }
}
