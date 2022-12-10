//
//  CarServiceIntegrationTest.swift
//  CarangasTests
//
//  Created by Breno Rocha on 10/12/22.
//

import XCTest
@testable import Carangas

class CarServiceIntegrationTest: XCTestCase {
    
    func test_loadCars_shouldReturnSuccess() {
        let sut = makeSUT()
        
        let expectation = expectation(description: "Success service!!!")
        
        sut.loadCars { result in
            switch result {
            case .failure:
                XCTFail("O serviço falhou")
            case .success: break
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    
    // MARK: - Helper
    private func makeSUT() -> CarService {
        CarService()
    }
}
