//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 29/10/22.
//

import UIKit

final class CarsListingCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsTableViewController.instantiateFromStoryboard(.listing)
        viewController.viewModel = CarsListingViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showCar(_ car: Car) {
        let childCoordinator = CarVisualizationCoordinator(navigationController: navigationController, car: car)
        add(childCoordinator: childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
    }
    
    func showCarCreation() {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController)
        add(childCoordinator: childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
    }
}
