//
//  Array+Only.swift
//  Memorize
//
//  Created by Trey Davis on 12/10/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
