//
//  DetailFoodViewController.swift
//  Foodies
//
//  Created by Andira Yunita on 20/01/23.
//

import UIKit

class DetailFoodViewController: UIViewController {
    
    @IBOutlet weak var detailFoodTableView: UITableView!
    
    var detailFoodsData: DetailFood?
    var idMeal: String = ""
    let viewModel = DetailFoodViewModel()
    
    init(idMeal: String) {
        self.idMeal = idMeal
        super.init(nibName: "DetailFoodViewController", bundle: nil)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getData()
    }
    
    func setup() {
        detailFoodTableView.delegate = self
        detailFoodTableView.dataSource = self
        
        detailFoodTableView.register(UINib(nibName: "DetailFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func getData() {
        viewModel.getFoodDetails(idMeal: idMeal) { [weak self] in
            self?.detailFoodsData = (self?.viewModel.detailFoodsModel)!
            DispatchQueue.main.async { self?.detailFoodTableView.reloadData() }
        }
        print("finally getData")
    }
}

extension DetailFoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailFoodsData?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("start cell row at")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailFoodTableViewCell
        cell.setFoodDetailsData(foodsDetailsModel: detailFoodsData?.meals[indexPath.row])
        if detailFoodsData != nil { title = (detailFoodsData?.meals[indexPath.row].strMeal)}
        print("cell row at here")
        return cell
    }
}
