//
//  ExchangeListViewController.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class ExchangeListViewController: ViewControllerBase<ExchangeListView> {
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        Task {
            await loadData()
        }
    }
    
    //MARK: Private functions
    private func setupUI() {
        navigationItem.title = "Exchanges"
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    private func setupActions() {
        customView.refreshAction = { [weak self] in
            Task {
                await self?.loadData()
            }
        }
    }
    
    private func loadData() async {
        guard !isLoading else { return }
        isLoading = true
        loading?.start()
        guard let viewModel = viewModel as? ExchangeListViewModel else { return }
        do {
            try await viewModel.fetchExchanges()
            reloadTableView()
        } catch(let error) {
            reloadTableView()
            handleError(error)
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = false
            self?.loading?.stop()
            self?.customView.refreshControl.endRefreshing()
            self?.customView.tableView.reloadData()
        }
    }
}

extension ExchangeListViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel as? ExchangeListViewModel else { return 0 }
        return viewModel.exchangeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel as? ExchangeListViewModel else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeListTableViewCell.identifier) as? ExchangeListTableViewCell else {
            return UITableViewCell()
        }
        let exchange = viewModel.exchangeList[indexPath.row]
        cell.setupCell(id: exchange.exchange_id ?? "", name: exchange.name ?? "", volume: exchange.volume_1day_usd ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel as? ExchangeListViewModel else { return }
        let exchange = viewModel.exchangeList[indexPath.row]
        SessionManager.shared.coordinator?.goToExchangeDetails(info: exchange)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
