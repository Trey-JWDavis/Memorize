//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Trey Davis on 12/8/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
