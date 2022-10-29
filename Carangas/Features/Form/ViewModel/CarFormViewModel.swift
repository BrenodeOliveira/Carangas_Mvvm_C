//
//  CarFormViewModel.swift
//  Carangas
//
//  Created by Usuário Convidado on 11/10/22.
//

import Foundation

final class CarFormViewModel {
    
    private var car: Car
    private let service = CarService()
    private var isEditing: Bool {
        car._id != nil
    }
    
    var onCarCreated: ((Result<Void, CarServiceError>) -> Void)?
    var onCarUpdated: ((Result<Void, CarServiceError>) -> Void)?
    
    var title: String { isEditing ? "Atualização" : "Cadastro" }
    var brand: String { car.brand }
    var name: String { car.name }
    var price: String { "\(car.price)" }
    var gasType: Int { car.gasType }
    var buttonTitle: String { isEditing ? "Atualizar carro" : "Cadastrar carro" }
    
    init(car: Car? = nil) {
        self.car = car ?? Car()
    }
    
    func save(name: String, brand: String, price: String, gasTypeIndex: Int) {
        
        car.name = name
        car.brand = brand
        car.price = Int(price) ?? 0
        car.gasType = gasType
        
        if isEditing {
            service.updateCar(car) { [weak self] result in
                self?.onCarUpdated?(result)
            }
        } else {
            service.createCar(car) { [weak self] result in
                self?.onCarCreated?(result)
            }
        }
        
    }
}
