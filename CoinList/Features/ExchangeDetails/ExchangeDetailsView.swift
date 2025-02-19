//
//  ExchangeDetailsView.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class ExchangeDetailsView: UIView {
    // MARK: Properties
    var nameLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.accessibilityIdentifier = Constants.Testing.exchangeName
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var idLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeHrsTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "US$ volume in the last 1 hour"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeHrsLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeDayTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "US$ volume in the last 1 day"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeDayLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeMthTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "US$ volume in the last 1 month"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeMthLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var tradeStartTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "Start trade date"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var tradeStartLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var tradeEndTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "End trade date"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var tradeEndLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let websiteLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    //MARK: Lifecycle
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Private Methods
    private func setupUI() {
        backgroundColor = .background
        addSubview(nameLabel)
        addSubview(idLabel)
        addSubview(volumeHrsTitleLabel)
        addSubview(volumeHrsLabel)
        addSubview(volumeDayTitleLabel)
        addSubview(volumeDayLabel)
        addSubview(volumeMthTitleLabel)
        addSubview(volumeMthLabel)
        addSubview(tradeStartTitleLabel)
        addSubview(tradeStartLabel)
        addSubview(tradeEndTitleLabel)
        addSubview(tradeEndLabel)
        addSubview(websiteLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeHrsTitleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 14),
            volumeHrsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeHrsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeHrsLabel.topAnchor.constraint(equalTo: volumeHrsTitleLabel.bottomAnchor, constant: 2),
            volumeHrsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeHrsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeDayTitleLabel.topAnchor.constraint(equalTo: volumeHrsLabel.bottomAnchor, constant: 14),
            volumeDayTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeDayTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeDayLabel.topAnchor.constraint(equalTo: volumeDayTitleLabel.bottomAnchor, constant: 2),
            volumeDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeDayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeMthTitleLabel.topAnchor.constraint(equalTo: volumeDayLabel.bottomAnchor, constant: 14),
            volumeMthTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeMthTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            volumeMthLabel.topAnchor.constraint(equalTo: volumeMthTitleLabel.bottomAnchor, constant: 2),
            volumeMthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            volumeMthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            tradeStartTitleLabel.topAnchor.constraint(equalTo: volumeMthLabel.bottomAnchor, constant: 14),
            tradeStartTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            tradeStartTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            tradeStartLabel.topAnchor.constraint(equalTo: tradeStartTitleLabel.bottomAnchor, constant: 2),
            tradeStartLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            tradeStartLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            tradeEndTitleLabel.topAnchor.constraint(equalTo: tradeStartLabel.bottomAnchor, constant: 14),
            tradeEndTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            tradeEndTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            tradeEndLabel.topAnchor.constraint(equalTo: tradeEndTitleLabel.bottomAnchor, constant: 2),
            tradeEndLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            tradeEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            websiteLabel.topAnchor.constraint(equalTo: tradeEndLabel.bottomAnchor, constant: 14),
            websiteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            websiteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            websiteLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
        ])
    }
}
