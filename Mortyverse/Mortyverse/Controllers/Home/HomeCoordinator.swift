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
    
    override func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        // Ensure the viewModel is assigned before pushing the view controller
        let model = HomeViewModel()
        controller.viewModel = model
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
