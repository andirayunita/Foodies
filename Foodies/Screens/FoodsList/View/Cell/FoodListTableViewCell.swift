//
//  FoodListTableViewCell.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageFood: UIImageView! {
        didSet {
            imageFood.layer.cornerRadius = imageFood.frame.height/2
        }
    }
    @IBOutlet weak var strMealLabel: UILabel!
    
    let viewModel = FoodListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFoodData(foodModel: Meal?) {
        if let foodModel = foodModel {
            strMealLabel.text = viewModel.configureName(model: foodModel)
            imageFood.downloaded(from: viewModel.configureImageUrl(model: foodModel))
        }
    }
    
//    class func nib() -> UINib { UINib(nibName: "FoodListTableViewCell", bundle: nil) }
}
