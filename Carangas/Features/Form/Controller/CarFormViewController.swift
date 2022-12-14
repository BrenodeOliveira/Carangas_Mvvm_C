//
//  CarFormViewController.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/06/22.
//

import UIKit

final class CarFormViewController: UIViewController {
	
	@IBOutlet weak var textFieldBrand: UITextField!
	@IBOutlet weak var textFieldName: UITextField!
	@IBOutlet weak var textFieldPrice: UITextField!
	@IBOutlet weak var segmentedControlGasType: UISegmentedControl!
	@IBOutlet weak var buttonSave: UIButton!
	
	var viewModel: CarFormViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        setupUI()
		setupViewModel()
	}
    
    private func setupViewModel() {
        viewModel?.onCarCreated = onCarCreated
        viewModel?.onCarUpdated = onCarUpdated
    }
    
    private func setupUI() {
        title = viewModel?.title
        textFieldBrand.text = viewModel?.brand
        textFieldName.text = viewModel?.name
        textFieldPrice.text = viewModel?.price
        segmentedControlGasType.selectedSegmentIndex = viewModel?.gasType ?? 0
        buttonSave.setTitle(viewModel?.buttonTitle, for: .normal)
    }
	
	@IBAction func save(_ sender: UIButton) {
		
        viewModel?.save(name: textFieldName.text!,
                        brand: textFieldBrand.text!,
                        price: textFieldPrice.text!,
                        gasTypeIndex: segmentedControlGasType.selectedSegmentIndex)
	}
	
//    private func onCarCreated(result: Result<Void, CarServiceError>) {
//        print("Carro criado")
//        showResult(result)
//    }
//
//    private func onCarUpdated(result: Result<Void, CarServiceError>) {
//        print("Carro atualizado")
//        showResult(result)
//    }
    
    lazy var onCarCreated: (Result<Void, CarServiceError>) -> () = { [weak self] result in
        print("Carro criado")
        self?.showResult(result)
    }
    
    lazy var onCarUpdated: (Result<Void, CarServiceError>) -> () =  { [weak self] in
        print("Carro atualizado")
        self?.showResult($0)
    }
    
	private func showResult(_ result: Result<Void, CarServiceError>) {
		switch result {
		case .success:
			DispatchQueue.main.async {
                self.viewModel?.back()
			}
		case .failure(let apiError):
			print(apiError.errorMessage)
		}
	}
}
