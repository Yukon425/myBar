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

        self.selectionStyle = .None
        // Configure the view for the selected state
    }

    func setCell(ingredient: Ingredient){
        self.nameLabel.text = ingredient.name
        self.nameLabel.textColor = .whiteColor()
        
        switch ingredient.category {
        case "mixer":
            self.iconImage.image = UIImage(named: "mixer")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "hardDrink":
            self.iconImage.image = UIImage(named: "hardDrink")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "softDrink":
            self.iconImage.image = UIImage(named: "softDrink")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "produce":
            self.iconImage.image = UIImage(named: "produce")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "beer":
            self.iconImage.image = UIImage(named: "beer")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "spice":
            self.iconImage.image = UIImage(named: "spice")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "ice":
            self.iconImage.image = UIImage(named: "ice")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        case "wine":
            self.iconImage.image = UIImage(named: "wine")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        default:
            self.iconImage.image = UIImage(named: "mixer")
            self.iconImage.image = iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.iconImage.tintColor = .whiteColor()
        }
    }
}
