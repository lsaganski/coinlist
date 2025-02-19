//
//  LaunchViewModel.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class LaunchViewModel: ViewModelProtocol {
    //MARK: Public functions
    func proceed() {
        SessionManager.shared.coordinator?.goToExchangeList()
    }
}
