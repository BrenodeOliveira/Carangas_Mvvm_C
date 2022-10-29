//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 29/10/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinator: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let childCoordinator = CarsListingCoordinator(navigationController: navigationController)
        add(childCoordinator: childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
    }
}
