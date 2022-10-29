//
//  Coordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 29/10/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var childCoordinator: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter { $0 !== coordinator }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let child = child {
            remove(childCoordinator: child)
        } else {
            parentCoordinator?.remove(childCoordinator: self)
        }
    }
}
