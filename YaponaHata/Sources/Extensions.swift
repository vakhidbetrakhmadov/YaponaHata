//
//  Extentions.swift
//  YaponaHata
//
//  Created by Vakhid Betrakhmadov on 27/02/2018.
//  Copyright © 2018 Vakhid Betrakhmadov. All rights reserved.
//

import Foundation

extension Double {
    var kg: Double { return self / 1000 }
}

extension Array where Element:Equatable {
    mutating func remove(item: Element) -> Element? {
        guard let index = index(of: item) else { return nil }
        return remove(at: index)
    }
}
