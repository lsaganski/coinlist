//
//  SessionManager.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

class SessionManager {
    //MARK: Properties
    static let shared = SessionManager()
    var coordinator: Coordinator?
     
    //MARK: Lifecycle
    private init() {}
}
