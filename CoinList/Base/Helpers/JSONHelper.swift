//
//  JSONHelper.swift
//  CoinList
//
//  Created by Leonardo Saganski on 18/02/25.
//

import Foundation

class JSONHelper {
    func readJSONFile(name: String) -> Data? {
        do {
            guard let path = Bundle.main.path(forResource: name, ofType: "json"),
                  let data = try String(contentsOfFile: path).data(using: .utf8) else {
                return nil
            }
            return data
        } catch {
            return nil
        }
    }
    
    func getObjectFromJSONData<T: Decodable>(_ data: Data) throws -> T {
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw error
        }
    }
    
    func getStringFromJSONData(_ data: Data) -> String {
        // Read response, for debug purposes.
        let strData = String(data: data, encoding: .utf8) ?? ""
        if let _ = try? JSONSerialization.jsonObject(with: data, options: []) {
            debugPrint(strData.replacingOccurrences(of: "\\", with: "") as AnyObject)
        } else {
            debugPrint(strData)
        }
        return strData
    }
}
