//
//  DetailFood.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import Foundation

struct DetailFood: Codable {
    let meals: [FoodDetails]
}

struct FoodDetails: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strCategory: String
    let strArea: String
}
