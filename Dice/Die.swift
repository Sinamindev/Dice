//
//  Die.swift
//  Dice
//
//  Created by Sina on 2/27/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit


class Die {
    
    //MARK: Properties
    
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

}
