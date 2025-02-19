//
//  NavigationController.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

enum NavigationControllerStyle {
    case none, back
    
    func getImage() -> UIImage? {
        switch self {
        case .back:
            UIImage(systemName: Constants.Images.back)
        default:
            nil
        }
    }
}

class NavigationController: UINavigationController {
    var leftButtonAction: (() -> ())?

    func setUpLeftButton(style: NavigationControllerStyle, action: (() -> ())? = nil) {
        if style == .none {
            navigationItem.setLeftBarButton(nil, animated: true)
        } else {
            self.leftButtonAction = action
            let button = UIBarButtonItem(image: style.getImage(), style: .plain, target: self, action: #selector(performLeftButtonAction))
            navigationItem.setLeftBarButton(button, animated: true)
        }
    }

    @objc
    func performLeftButtonAction() {
        self.leftButtonAction?()
    }
}
