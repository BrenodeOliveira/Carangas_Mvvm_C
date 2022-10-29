//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 29/10/22.
//

import UIKit

final class CarVisualizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private let car: Car
    
    init(navigationController: UINavigationController, car: Car) {
        self.navigationController = navigationController
        self.car = car
    }
    
    func start() {
        let viewController = CarViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = CarVisualizationViewModel(car: car, coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}
