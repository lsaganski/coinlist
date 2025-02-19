//
//  Loading.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class Loading {
    let indicator: UIActivityIndicatorView = {
        $0.tintColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIActivityIndicatorView(style: .large))
    
    var background = UIView()
    
    init(view: UIView) {
        setupUI(view)
    }
    
    func setupUI(_ view: UIView) {
        self.background = UIView(frame: UIScreen.main.bounds)
        self.background.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.background.addSubview(self.indicator)
        self.background.isHidden = true
        view.addSubview(self.background)
        
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func start() {
        self.background.isHidden = false
        self.indicator.startAnimating()
    }
    
    func stop() {
        self.background.removeFromSuperview()
        self.indicator.stopAnimating()
    }
}
