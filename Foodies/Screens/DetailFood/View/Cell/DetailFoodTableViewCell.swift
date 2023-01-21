//
//  DetailFoodTableViewCell.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import UIKit

class DetailFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
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
            categoryLabel.text = viewModel.configureCategory(model: foodsDetailsModel)
            fromLabel.text = viewModel.configureArea(model: foodsDetailsModel)
            instructionLabel.text = viewModel.configureInstructions(model: foodsDetailsModel)
        }
    }
    
    class func nib() -> UINib { UINib(nibName: "DetailFoodTableViewCell", bundle: nil) }
}
