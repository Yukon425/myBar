//
//  IngredientTableViewCell.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/8/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(ingredient: Ingredient){
        self.nameOutlet.text = ingredient.name
        self.nameOutlet.textColor = .whiteColor()
        
        switch ingredient.category {
            case "mixer":
                self.imageViewOutlet.image = UIImage(named: "mixer")
            case "hardDrink":
                self.imageViewOutlet.image = UIImage(named: "hardDrink")
            case "softDrink":
                self.imageViewOutlet.image = UIImage(named: "softDrink")
            case "produce":
                self.imageViewOutlet.image = UIImage(named: "produce")
            case "beer":
                self.imageViewOutlet.image = UIImage(named: "beer")
            case "spice":
                self.imageViewOutlet.image = UIImage(named: "spice")
            default:
                self.imageViewOutlet.image = UIImage(named: "mixer")
        }
    }
    
    

}
