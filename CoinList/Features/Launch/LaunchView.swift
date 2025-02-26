//
//  LaunchView.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class LaunchView: UIView {
    // MARK: Properties
    let logoImageView: UIImageView = {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

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
        backgroundColor = .white
        addSubview(logoImageView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 135),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -135),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
}
