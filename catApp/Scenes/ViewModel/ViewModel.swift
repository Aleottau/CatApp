//
//  ViewModel.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import UIKit


protocol ViewModelProtocol {
    func setUpInitial(windowScene: UIWindowScene) -> UIWindow
    func getCatList(callback: @escaping (Result<[CatModel],CatError>) -> Void)
    func getCatImage(referenceId: String, callback: @escaping (Result<UIImage?,CatError>) -> Void)
}

class ViewModel {
    let coordinator: CoordinatorProtocol
    let interactor: InteractorProtocol
    init(coordinator: CoordinatorProtocol, interactor: InteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
}

extension ViewModel: ViewModelProtocol {
    func getCatImage(referenceId: String, callback: @escaping (Result<UIImage?, CatError>) -> Void) {
        interactor.getCatImage(referenceId: referenceId, callback: callback)
    }
    
    func getCatList(callback: @escaping (Result<[CatModel], CatError>) -> Void) {
        interactor.getCatList(callback: callback)
    }
    
    func setUpInitial(windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = coordinator.initialController(with: self)
        window.makeKeyAndVisible()
        return window
    }
    
    
}
