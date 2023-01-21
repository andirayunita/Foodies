//
//  FoodListViewModel.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import Foundation

class FoodListViewModel {
    
    var detailFoodModel: Foods?
    var idMeal: String = ""
    
    func parseJson(completion: @escaping () -> ()) {
        guard let urlFood = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood") else { return }
        let dataTask = URLSession.shared.dataTask(with: urlFood) { data, response, error in
            if error == nil, data != nil {
                do {
                    let foodsData = try JSONDecoder().decode(Foods.self, from: data!)
                    self.detailFoodModel = foodsData
                    completion()
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
    func configureName(model: Meal) -> String {
        let name = model.strMeal
        return name
    }
    
    func configureImageUrl(model: Meal) -> String {
        let img = model.strMealThumb
        return img
    }
}
