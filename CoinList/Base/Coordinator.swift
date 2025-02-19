//
//  Coordinator.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: NavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    //MARK: Properties
    var navigationController = NavigationController()
    var window: UIWindow?
    
    //MARK: Public functions
    func setUp(window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func start() {
        goToLaunch()
    }

    func goToLaunch() {
        let vm = LaunchViewModel()
        let vc = LaunchViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: true)
    }

    func goToExchangeList() {
        let vm = ExchangeListViewModel(service: Service())
        let vc = ExchangeListViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: true)
    }

    func goToExchangeDetails(info: Exchange) {
        let vm = ExchangeDetailsViewModel()
        vm.setData(exchange: info)
        let vc = ExchangeDetailsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    @objc
    func back() {
        navigationController.popViewController(animated: true)
    }
}
