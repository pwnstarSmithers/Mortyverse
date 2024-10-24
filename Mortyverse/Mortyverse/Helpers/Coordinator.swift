//
//  Coordinator.swift
//  Mortyverse
//
//  Created by Mugalu on 09/09/2024.
//

import UIKit

class Coordinator: NSObject {
    var completion: () -> Void = {}

    var subCoordinator: Coordinator?
    weak var parentCoordinator: Coordinator?
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?, completion: (() -> Void)?) {
        self.navigationController = navigationController

        if let completion = completion {
            self.completion = completion
        }
    }

    convenience init(viewController: UIViewController, completion: (() -> Void)?) {
        self.init(navigationController: viewController.navigationController, completion: completion)
    }

    init(parentCoordinator: Coordinator?) {
        self.completion = parentCoordinator?.completion ?? {}
        self.navigationController = parentCoordinator?.navigationController

        super.init()

        parentCoordinator?.subCoordinator = self
        self.parentCoordinator = parentCoordinator
    }

    func start() {}

    func start(subCoordinator: Coordinator) {
        self.subCoordinator = subCoordinator
        self.subCoordinator?.start()
    }

    func completeSubWorkflow() {
        self.subCoordinator = nil
    }

    func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }

    func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }

    func popToViewController<T: UIViewController>(ofType type: T.Type) {
        guard let viewController = viewControllerFromNavStack(ofType: type) else {
            return
        }

        navigationController?.popToViewController(viewController, animated: true)
    }

    func viewControllerFromNavStack<T: UIViewController>(ofType type: T.Type) -> UIViewController? {
        navigationController?.viewControllers.last(where: { $0.isKind(of: type) })
    }

    func finishWorkflow() {
        if let parentWorkflow = parentCoordinator {
            parentWorkflow.completeSubWorkflow()
        } else {
            completeSubWorkflow()
            completion()
        }
    }

    func topViewController() -> UIViewController? {
        var topController: UIViewController? = navigationController
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }

        return topController
    }

  
    func goToSystemSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }

}
