//
//  ProductViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 22/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productimgview: UIImageView!
    
    @IBOutlet weak var productdesc: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
}
    //let candies = productsList
      
      //candy = Product Model
var productsList : [ProductModel] = []



class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
      
  // @IBOutlet var searchFooter: SearchFooter!

      override func viewDidLoad() {
          super.viewDidLoad()
          tableView.dataSource = self
          tableView.delegate = self

        
//id: Int, desc: String, price: Int, unitprice: Int, imgName: String
      if productsList.count == 0 {

        productsList.append(ProductModel(id: 1, desc: "brownies", price: 14, unitprice: 100, imgName : "brownies"))
      
        productsList.append(ProductModel(id: 2, desc: "bubbletea", price: 13, unitprice: 100, imgName : "bubbletea"))
      
          productsList.append(ProductModel(id: 3, desc: "cornflakecookies", price: 10, unitprice: 100, imgName : "cornflakecookies"))
      
        productsList.append(ProductModel(id: 4, desc: "speculoostarts", price: 10, unitprice: 100, imgName : "speculoostarts"))
      
        productsList.append(ProductModel(id: 5, desc: "seasaltchoc", price: 13, unitprice: 100, imgName : "seasaltchoc"))
        
        productsList.append(ProductModel(id: 6, desc: "eggtart", price: 12, unitprice: 100, imgName : "eggtart"))
        
        productsList.append(ProductModel(id: 7, desc: "hokkienmee", price: 13, unitprice: 100, imgName : "hokkienmee"))
        
        productsList.append(ProductModel(id: 8, desc: "gin and tonic", price: 18, unitprice: 100, imgName : "bubbletea"))
        
        productsList.append(ProductModel(id: 9, desc: "ice cream", price: 13, unitprice: 100, imgName : "icecream"))
        
        productsList.append(ProductModel(id: 10, desc: "korean chicken", price: 24, unitprice: 100, imgName : "koreanchix"))
        
        productsList.append(ProductModel(id: 11, desc: "chi cha san chen", price: 13, unitprice: 100, imgName : "oolongmilktea"))
        
        productsList.append(ProductModel(id: 12, desc: "pasta", price: 23, unitprice: 100, imgName : "pasta"))
        
        productsList.append(ProductModel(id: 13, desc: "chicken rice", price: 15, unitprice: 100, imgName : "chickenrice"))
        
        productsList.append(ProductModel(id: 14, desc: "coffee", price: 16, unitprice: 100, imgName : "coffee"))
        
        productsList.append(ProductModel(id: 15, desc: "xiao long bao", price: 24, unitprice: 100, imgName : "soupdumplings"))
        
         productsList.append(ProductModel(id: 16, desc: "steak", price: 12, unitprice: 100, imgName : "steak"))
        
         productsList.append(ProductModel(id: 17, desc: "sushi", price: 45, unitprice: 100, imgName : "sushi"))
        
        productsList.append(ProductModel(id: 18, desc: "smores cookie", price: 15, unitprice: 100, imgName : "marshmallow"))
        
        productsList.append(ProductModel(id: 19, desc: "biscoff cookie", price: 15, unitprice: 100, imgName : "biscoff"))
        
      }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{

        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
            cell.productdesc.text = productsList[indexPath.row].desc
            cell.price.text = "\(productsList[indexPath.row].price) credits"
            cell.productimgview.image = UIImage(named: productsList[indexPath.row].imgName)
        return cell
    }
    
    // did select rowat
    //index path islike an add to say which which cell or row is being processed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductDetail", sender: nil)
    }
    // this func will be invoked each time a segue is about to be performed from this view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail" {
            if let target = segue.destination as? ProductDetailViewController {
                target.productId = productsList[tableView.indexPathForSelectedRow!.row].id
            }
//
//                if let indexPath = tableView.indexPathForSelectedRow {
//                  tableView.deselectRow(at: indexPath, animated: true)
                }
                
        }
    }
    



   
