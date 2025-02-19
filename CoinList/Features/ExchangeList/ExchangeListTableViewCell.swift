//
//  ExchangeListTableViewCell.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation
import UIKit

class ExchangeListTableViewCell: UITableViewCell {
    //MARK: Properties
    static var identifier: String {
        String(describing: self)
    }

    var nameLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var idLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeTitleLabel: UILabel = {
        $0.textColor = .primary
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "US$ volume in the last 1 day"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    var volumeLabel: UILabel = {
        $0.textColor = .secondary
        $0.font = .systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ExchangeListTableViewCell.identifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    override func didMoveToSuperview() {
        layoutIfNeeded()
    }

    //MARK: Private functions
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(nameLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(volumeTitleLabel)
        contentView.addSubview(volumeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),

            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),

            volumeTitleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            volumeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            volumeTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),

            volumeLabel.topAnchor.constraint(equalTo: volumeTitleLabel.bottomAnchor, constant: 2),
            volumeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            volumeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            volumeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    //MARK: Public functions
    func setupCell(id: String, name: String, volume: Double) {
        self.idLabel.text = id
        self.nameLabel.text = name
        self.volumeLabel.text = "\(volume)"
    }
}
