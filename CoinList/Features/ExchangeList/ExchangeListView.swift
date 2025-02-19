//
//  ExchangeListView.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class ExchangeListView: UIView {
    // MARK: Properties
    let tableView: UITableView = {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 130
        $0.backgroundColor = .background
        $0.separatorStyle = .none
        $0.accessibilityIdentifier = Constants.Testing.exchangeList
        $0.register(ExchangeListTableViewCell.self, forCellReuseIdentifier: ExchangeListTableViewCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())

    let refreshControl: UIRefreshControl = {
        $0.tintColor = .secondary
        $0.attributedTitle = NSAttributedString(string: "Loading...", attributes: [.foregroundColor: UIColor.white])
        return $0
    }(UIRefreshControl())

    let topAnchorConstant = 100.0
    var refreshAction: (() -> ())?

    //MARK: Lifecycle
    init() {
        super.init(frame: .zero)
        setupUI()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Private Methods
    private func setupUI() {
        backgroundColor = .background
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: topAnchorConstant),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func setupActions() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(performRefreshAction), for: .valueChanged)
    }
    
    @objc
    private func performRefreshAction() {
        guard let refreshAction else { return }
        refreshAction()
    }
}
