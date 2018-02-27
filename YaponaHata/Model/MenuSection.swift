//
//  MenuSection.swift
//  YaponaHata
//
//  Created by Vakhid Betrakhmadov on 27/02/2018.
//  Copyright © 2018 Vakhid Betrakhmadov. All rights reserved.
//

import UIKit

class MenuSection {
    
    // MARK: - Public -
    
    // MARK: Instance properties
    let name: String
    
    // MARK: Inits
    init(name: String) {
        self.name = name
    }
    
    // MARK: Instance methods
    subscript(index: Int) -> Dish {
        get {
            return dishes[index]
        }
        set {
            dishes[index] = newValue
        }
    }
    
    func add(dish: Dish) {
        dishes.append(dish)
    }
    
    func remove(dish: Dish) -> Dish? {
        return dishes.remove(item: dish)
    }
    
    // MARK: - Private -
    
    // MARK: Instance properties
    private var dishes = [Dish]()
}
