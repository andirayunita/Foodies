//
//  FoodListViewController.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var foodListTableView: UITableView!
    
    var infoMeal = [Meal]()
    var viewModel = FoodListViewModel()
    var foodsData: Foods?
    var cellTapped: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getData()
    }
    
    func setup() {
        foodListTableView.delegate = self
        foodListTableView.dataSource = self
        
        foodListTableView.register(UINib(nibName: "FoodListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        navigationItem.title = "Seafood"
        navigationItem.backButtonTitle = ""
    }
    
    func getData() {
        viewModel.parseJson { [weak self] in
            self?.foodsData = self?.viewModel.detailFoodModel
            self?.infoMeal = (self?.viewModel.detailFoodModel!.meals)!
            DispatchQueue.main.async { self?.foodListTableView.reloadData() }
        }
    }
}

extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoMeal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodListTableViewCell
        cell.setFoodData(foodModel: infoMeal[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellTapped = indexPath.row
        print("You selected cell #\(cellTapped)!")
        let detailFoodViewController = DetailFoodViewController(idMeal: infoMeal[cellTapped].idMeal)
        navigationController?.pushViewController(detailFoodViewController, animated: true)
    }
    
}
