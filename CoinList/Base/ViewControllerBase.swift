//
//  ViewControllerBase.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import UIKit

class ViewControllerBase<T: UIView>: UIViewController {
    // MARK: Properties
    var customView: T {
        view as! T
    }
    
    var viewModel: ViewModelProtocol
    var errorBanner: ErrorBanner?
    var isLoading = false
    var loading: Loading?

    // MARK: Lifecycle
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = T()
        navigationController?.navigationBar.tintColor = .primary
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primary]
    }
    
    override func viewDidLoad() {
        loading = Loading(view: view)
        errorBanner = ErrorBanner(view: view)
    }
        
    // MARK: Navigation SetUp
    func showBarBackButton() {
        let image = UIImage(systemName: Constants.Images.back)?.withRenderingMode(.alwaysTemplate)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(performLeftButtonAction))
    }
    
    @objc
    private func performLeftButtonAction() {
        SessionManager.shared.coordinator?.back()
    }

    func hideLeftButton() {
        navigationItem.leftBarButtonItem = nil
    }
    
    //MARK: Public functions
    func handleError(_ error: Error) {
        guard let error = error as? ServiceError else {
            showErrorMessage(message: error.localizedDescription)
            return
        }
        showErrorMessage(message: error.getMessage())
    }
    
    func showErrorMessage(message: String) {
        DispatchQueue.main.async { [weak self] in 
            self?.errorBanner?.showError(message)
        }
    }
}
