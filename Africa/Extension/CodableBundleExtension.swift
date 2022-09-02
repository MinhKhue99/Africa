//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 02/09/2022.
//

import Foundation
extension Bundle {
    func decode<T: Codable> (_ file: String) -> T {
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle")
        }
        // 2. Create the property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in the bundle")
        }
        // 3. Create decoder
        let decoder = JSONDecoder()
        // 4. Create property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in the bundle")
        }
        // 5. Return the ready-to-use data
        return loaded
    }
}
