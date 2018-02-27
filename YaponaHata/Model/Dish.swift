//
//  Dish.swift
//  YaponaHata
//
//  Created by Vakhid Betrakhmadov on 27/02/2018.
//  Copyright © 2018 Vakhid Betrakhmadov. All rights reserved.
//

import UIKit

struct Dish {
    
    // MARK: - Public -
    
    // MARK: Nesteds
    enum Tag: String {
        case popular, new
    }
    
    // MARK: Instance properties
    let name: String
    let contents: String
    let price: Double
    let imageURL: URL
    let weightGr: Double?
    
    // MARK: Inits
    init(name: String, contents: String, price: Double, imageURL: URL, tags: [Tag] = [Tag](), weightGr: Double? = nil) {
        self.name = name
        self.contents = contents
        self.price = price
        self.imageURL = imageURL
        self.weightGr = weightGr
        self.tags = tags
    }
    
    // MARK: Instance methods
    mutating func add(tag: Tag) {
        tags.append(tag)
    }
    
    @discardableResult
    func remove(tag: Tag) -> Tag {
        return remove(tag: tag)
    }
    
    func isTagged(by tag: Tag) -> Bool {
        return tags.contains(tag)
    }
    
    func copy(newName: String? = nil, newContents: String? = nil, newPrice: Double?, newImageURL: URL? = nil, newWeightGr: Double? = nil, newTags: [Tag]?) -> Dish {
        return Dish(name: newName ?? self.name,
                    contents: newContents ?? self.contents,
                    price: newPrice ?? self.price,
                    imageURL: newImageURL ?? self.imageURL,
                    tags: newTags ?? self.tags,
                    weightGr: newWeightGr ?? self.weightGr)
    }
    
    // MARK: - Private -
    
    // MARK: Instance properties
    private var tags: [Tag]
}

extension Dish: Equatable {
    static func ==(lhs: Dish, rhs: Dish) -> Bool {
        return lhs.name == rhs.name &&
                rhs.contents == rhs.contents &&
                lhs.price == rhs.price &&
                lhs.weightGr == rhs.weightGr
    }
}
