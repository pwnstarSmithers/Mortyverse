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
    
    func primaryViewController() -> HomeViewController {
        let model = HomeViewModel()
        
        let controller = HomeViewController()
        controller.viewModel = model
        return controller
    }
    
    override func start(subCoordinator: Coordinator) {
        navigationController?.pushViewController(primaryViewController(), animated: true)
    }
}
