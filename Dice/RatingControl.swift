//
//  RatingControl.swift
//  Dice
//
//  Created by Sina on 2/26/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
    }
    }
    
    @IBInspectable var starCount: Int = 6 {
        didSet {
            setupButtons()
    }
    }


    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
            }
    }
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let Six1 = UIImage(named:"Six1", in: bundle, compatibleWith: self.traitCollection)
        let Six2 = UIImage(named:"Six2", in: bundle, compatibleWith: self.traitCollection)
        let Six3 = UIImage(named:"Six3", in: bundle, compatibleWith: self.traitCollection)
        //let Six4 = UIImage(named:"Six4", in: bundle, compatibleWith: self.traitCollection)
        //let Six5 = UIImage(named:"Six5", in: bundle, compatibleWith: self.traitCollection)
        //let Six6 = UIImage(named:"Six6", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0..<starCount {
            // Create button
            let button = UIButton()
            
            // Set the button images
            button.setImage(Six1, for: .normal)
            button.setImage(Six2, for: .selected)
            button.setImage(Six3, for: .highlighted)
            button.setImage(Six3, for: [.highlighted, .selected])
            
            // Add Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }

    // Updates the selection state of the buttons
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }

}
