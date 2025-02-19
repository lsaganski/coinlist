//
//  ErrorBanner.swift
//  CoinList
//
//  Created by Leonardo Saganski on 19/02/25.
//

import UIKit

class ErrorBanner {
    let background: UIView = {
        $0.backgroundColor = .errorBackground
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    let label: UILabel = {
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var bannerTopConstraint: NSLayoutConstraint?
    var view: UIView
    var isShowing = false
    
    init(view: UIView) {
        self.view = view
        setupUI()
    }
    
    func setupUI() {
        background.addSubview(label)
        view.addSubview(background)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),

            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
        ])
        
        bannerTopConstraint = background.topAnchor.constraint(equalTo: view.bottomAnchor)
        bannerTopConstraint?.constant = -1
        bannerTopConstraint?.isActive = true
    }
    
    func showError(_ message: String) {
        guard !isShowing else { return }
        isShowing = true
        label.text = message
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.bannerTopConstraint?.constant = (self?.background.bounds.height ?? 0) * -3
            self?.view.layoutIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.clear()
            }
        }
    }
    
    func clear() {
        isShowing = false
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.bannerTopConstraint?.constant = 0
            self?.view.layoutIfNeeded()
        }
    }
}
