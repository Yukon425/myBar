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
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "hardDrink":
            self.imageViewOutlet.image = UIImage(named: "hardDrink")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "softDrink":
            self.imageViewOutlet.image = UIImage(named: "softDrink")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "produce":
            self.imageViewOutlet.image = UIImage(named: "produce")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "beer":
            self.imageViewOutlet.image = UIImage(named: "beer")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "spice":
            self.imageViewOutlet.image = UIImage(named: "spice")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "ice":
            self.imageViewOutlet.image = UIImage(named: "ice")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        case "wine":
            self.imageViewOutlet.image = UIImage(named: "wine")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        default:
            self.imageViewOutlet.image = UIImage(named: "mixer")
            self.imageViewOutlet.image = imageViewOutlet.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.imageViewOutlet.tintColor = .whiteColor()
        }
    }
    
    

}
