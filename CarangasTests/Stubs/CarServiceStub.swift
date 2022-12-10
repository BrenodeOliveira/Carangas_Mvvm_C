//
//  CarServiceStub.swift
//  CarangasTests
//
//  Created by Breno Rocha on 10/12/22.
//

import Foundation
@testable import Carangas

final class CarServiceStub: CarServiceProtocol {
    func loadCars(onComplete: @escaping (Result<[Car], CarServiceError>) -> Void) {
        let car1 = Car()
        car1.brand = "Ford"
        car1.name = "Ka"
        car1.gasType = 2
        car1.price = 5000
        car1._id = UUID().uuidString
        
        let car2 = Car()
        car2.brand = "Chevrolet"
        car2.name = "Camaro amarelo"
        car2.gasType = 1
        car2.price = 100000
        car2._id = UUID().uuidString
        
        
        let cars: [Car] = [car1, car2]
        
        onComplete(.success(cars))
    }
    
    func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, CarServiceError>) -> Void) { }
    
    
}
