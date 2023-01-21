//
//  DetailFoodTableViewCell.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import UIKit

class DetailFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    let viewModel = DetailFoodViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFoodDetailsData(foodsDetailsModel: FoodDetails?) {
        if let foodsDetailsModel = foodsDetailsModel {
            foodImage.downloaded(from: viewModel.configureImageUrl(model: foodsDetailsModel))
            ingredientLabel.text = viewModel.configureIngredients(model: foodsDetailsModel)
            measurementLabel.text = viewModel.configureMeasurements(model: foodsDetailsModel)
            instructionLabel.text = viewModel.configureInstructions(model: foodsDetailsModel)
        }
    }
    
//    class func nib() -> UINib { UINib(nibName: "DetailFoodTableViewCell", bundle: nil) }
}
