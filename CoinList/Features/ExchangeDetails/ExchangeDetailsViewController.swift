//
//  ExchangeDetailsViewController.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class ExchangeDetailsViewController: ViewControllerBase<ExchangeDetailsView> {
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        loadData()
    }

    //MARK: Private functions
    private func setupUI() {
        navigationItem.title = "Details"
    }

    private func setupActions() {
        showBarBackButton()
    }

    private func loadData() {
        guard let viewModel = viewModel as? ExchangeDetailsViewModel,
              let exchange = viewModel.exchange else { return }
        customView.nameLabel.text = exchange.name
        customView.idLabel.text = exchange.exchange_id
        customView.volumeHrsLabel.text = String(exchange.volume_1hrs_usd ?? 0)
        customView.volumeDayLabel.text = String(exchange.volume_1day_usd ?? 0)
        customView.volumeMthLabel.text = String(exchange.volume_1mth_usd ?? 0)
        customView.tradeStartLabel.text = exchange.data_trade_start
        customView.tradeEndLabel.text = exchange.data_trade_end
        customView.websiteLabel.text = exchange.website
    }
}
