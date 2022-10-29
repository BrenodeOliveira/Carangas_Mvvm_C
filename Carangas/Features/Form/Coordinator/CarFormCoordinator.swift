//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 29/10/22.
//

import UIKit

final class CarFormCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private var car: Car?
    
    init(navigationController: UINavigationController, car: Car?) {
        self.navigationController = navigationController
        self.car = car
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = CarFormViewModel(car: car, coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}
