//
//  LocalDBService.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation

protocol LocalDBServiceProtocol {
    func save<T: Codable>(_ object: T, key: DBKeys) -> Bool
    func load<T: Codable>(_ type: T.Type, key: DBKeys) -> T?
    func remove(key: DBKeys)
}

enum DBKeys: String {
    case profile
}

class LocalDBService: LocalDBServiceProtocol {
    
    private var userDefaults: UserDefaults = .standard
    static let shared = LocalDBService()
    
    private init() {}
    
    func save<T: Codable>(_ object: T, key: DBKeys) -> Bool {
        guard let data = try? JSONEncoder().encode(object)else {
            return false
        }
        userDefaults.set(data, forKey: key.rawValue)
        return true
    }
    
    func load<T: Codable>(_ type: T.Type, key: DBKeys) -> T? {
        
        let decoder = JSONDecoder()
        guard let data = userDefaults.data(forKey: key.rawValue),
              let decodedData = try? decoder.decode(T.self, from: data)
               else { return nil }
        return decodedData
    }
    
    func remove(key: DBKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
