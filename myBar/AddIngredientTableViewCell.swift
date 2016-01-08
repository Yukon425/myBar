//
//  AddIngredientTableViewCell.swift
//  myBar
//
//  Created by Sean Chang on 1/8/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class AddIngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(ingredient: Ingredient){
        self.nameLabel.text = ingredient.name
        self.nameLabel.textColor = .whiteColor()
        
        switch ingredient.category {
        case "mixer":
            self.iconImage.image = UIImage(named: "mixer")
        case "hardDrink":
            self.iconImage.image = UIImage(named: "hardDrink")
        case "softDrink":
            self.iconImage.image = UIImage(named: "softDrink")
        case "produce":
            self.iconImage.image = UIImage(named: "produce")
        case "beer":
            self.iconImage.image = UIImage(named: "beer")
        case "spice":
            self.iconImage.image = UIImage(named: "spice")
        default:
            self.iconImage.image = UIImage(named: "mixer")
        }
    }
}
