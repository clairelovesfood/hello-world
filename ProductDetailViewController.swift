//
//  ProductDetailViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 23/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productdesc: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var subprice: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var txtfield: UITextField!
    
    var productId : Int = 0
    var unitPrice : Int = 0
    var productImgName: String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productdesc.text = productsList[productId-1].desc
        productImgName = productsList[productId-1].imgName
        image.image = UIImage(named:productsList[productId-1].imgName)
        unitPrice = productsList[productId-1].price
        price.text = "\(productsList[productId-1].price) credits"
        
        txtfield.text = "\(Int(stepper.value))"
        subprice.text = "Sub-Total: " + price.text!
        
    }
    
    @IBAction func StepperBtn(_ sender: UIStepper) {
        
        txtfield.text = "\(Int(sender.value))"
        
        subprice.text = "\(Int(sender.value) * unitPrice) credits"
    }
    @IBAction func AddBtn(_ sender: UIButton) {
        
        //if item already insidde the cart,
        // just increase the qty
        var Incart = false
        for cart in cartList {
            if cart.desc == productdesc.text! {
                //just increase qty
                cart.txtfield += Int(txtfield.text!)!
                // increase the sub-total
                cart.subprice = Int(txtfield.text!)! * unitPrice
                Incart = true
                break
            }
        }
        //else,
        //add the entire item as a new cart item
        if Incart == false {
            let myCartItem : CartModel = CartModel(id: productId-1,
            desc: productdesc.text!,
            Price : unitPrice,
            imgName: productImgName,
            txtfield: Int(txtfield.text!)!,
            subprice: Int(txtfield.text!)! * unitPrice)
            cartList.append(myCartItem)
        }
        
        //id: Int, desc: String, Price: Int, Qty: Int, imgName: String, txtfield: Int, subprice : Int

        
        let alert = UIAlertController(title: "Success!", message: "Item successfully added to cart", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
 
    }
    

}

