//
//  DetailFoodViewModel.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import Foundation

class DetailFoodViewModel {
    
    var detailFoodsModel: DetailFood?
    
    func getFoodDetails(idMeal: String, completion: @escaping () -> ()) {
        guard let urlDetailFood = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else { return }
        let dataTask = URLSession.shared.dataTask(with: urlDetailFood) { data, response, error in
            if error == nil, data != nil {
                do {
                    let foodDetail = try JSONDecoder().decode(DetailFood.self, from: data!)
                    DispatchQueue.main.async { [weak self] in
                        self?.detailFoodsModel = foodDetail
                        completion()
                    }
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
    func configureImageUrl(model: FoodDetails) -> String {
        let img = model.strMealThumb
        return img
    }
    
    func configureInstructions(model: FoodDetails) -> String {
        let instructions = model.strInstructions
        return instructions
    }
    
    func configureCategory(model: FoodDetails) -> String {
        let category = model.strCategory
        return category
    }
    
    func configureTags(model: FoodDetails) -> String {
        let tags = model.strTags
        return tags
    }
}
