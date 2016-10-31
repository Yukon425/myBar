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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ ingredient: Ingredient){
        self.nameOutlet.text = ingredient.name
        self.nameOutlet.textColor = UIColor.white

        
        switch ingredient.category {
        case "mixer":
            self.imageViewOutlet.image = UIImage(named: "mixer")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
            case "hardDrink":
            self.imageViewOutlet.image = UIImage(named: "hardDrink")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "softDrink":
            self.imageViewOutlet.image = UIImage(named: "softDrink")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "produce":
            self.imageViewOutlet.image = UIImage(named: "produce")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "beer":
            self.imageViewOutlet.image = UIImage(named: "beer")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "spice":
            self.imageViewOutlet.image = UIImage(named: "spice")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "ice":
            self.imageViewOutlet.image = UIImage(named: "ice")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        case "wine":
            self.imageViewOutlet.image = UIImage(named: "wine")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        default:
            self.imageViewOutlet.image = UIImage(named: "mixer")
            self.imageViewOutlet.image = imageViewOutlet.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.imageViewOutlet.tintColor = UIColor.white
        }
    }
    
    

}
