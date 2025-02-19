//
//  LaunchViewController.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class LaunchViewController: ViewControllerBase<LaunchView> {
    override func viewDidLoad() {
        guard let viewModel = viewModel as? LaunchViewModel else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            viewModel.proceed()
        }
    }
}
