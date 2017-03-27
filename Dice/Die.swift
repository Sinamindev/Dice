//
//  Die.swift
//  Dice
//
//  Created by Sina on 2/27/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit
import os.log


class Die: NSObject, NSCoding {
    
    //MARK: Properties
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 6 inclusively
        guard (rating >= 0) && (rating <= 6) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Die object.", log: OSLog.default, type: .debug)
            return nil
            
            // Because photo is an optional property of Die, just use conditional cast.
            let photo = aDecoder.decodeObjectForKey(PropertyKey.photo) as? UIImage
            
            let rating = aDecoder.decodeIntegerForKey(PropertyKey.rating)
            
            // Must call designated initializer.
            self.init(name: name, photo: photo, rating: rating)
        }
    }

}
