//
//  FoodModel.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import Foundation

struct Foods: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}
