//
//  ViewController.swift
//  FoodStack
//
//  Created by Ronald Hernandez on 10/23/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let burgerButton = UIButton()
    let pizzaButton = UIButton()
    let sandwichButton = UIButton()
    let tacoButton = UIButton()
    let orderNowButton = UIButton()
    let selectedItemThumbImage = UIImage(named: "burger")
    let topViewHolder = UIView()
    let mainThumbViewHolder = UIView()
    let buttonViewHolder = UIView()
    let bottomViewHolder = UIView()
    let topThumbButton = UIButton()
    let topTitleLabel = UILabel()
    
    var views = Dictionary<String, AnyObject>()
    var constraints = [NSLayoutConstraint]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        
        self.topViewHolder.backgroundColor = UIColor.whiteColor()
        self.mainThumbViewHolder.backgroundColor = UIColor(red: 220.0/255.0, green: 224.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        self.buttonViewHolder.backgroundColor = UIColor(red: 242.0/255.0, green: 241.0/255.0, blue: 239.0/255.0, alpha: 1.0)
       self.bottomViewHolder.backgroundColor = UIColor(red: 39.0/255.0, green: 61.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        
        self.topViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.mainThumbViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.bottomViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.buttonViewHolder.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(topViewHolder)
        self.view.addSubview(mainThumbViewHolder)
        self.view.addSubview(buttonViewHolder)
        self.view.addSubview(bottomViewHolder)
        
        
        self.views["topViewHolder"] = topViewHolder
        self.views["mainThumbViewHolder"] = mainThumbViewHolder
        self.views["bottomViewHolder"] = bottomViewHolder
        self.views["buttonViewHolder"] = buttonViewHolder
        
        setConstraints()
    }
    
    func setConstraints() {
       
        /**TOP VIEW CONTROLLER **/
        
        addConstraint( "V:|-[topViewHolder(50)]-0-[mainThumbViewHolder]")
        addConstraint("H:|-0-[topViewHolder]-0-|")
        
        /* MainView Holder **/
        
        addConstraint("V:[mainThumbViewHolder(<=250@250)]-0-[buttonViewHolder]")
        addConstraint("V:[mainThumbViewHolder(>=150@250)]") //when landscape
        addConstraint("H:|-0-[mainThumbViewHolder(==topViewHolder)]-0-|")
        
        /**Main Button Holder**/
        
        addConstraint("V:[buttonViewHolder(<=200)]-0-[bottomViewHolder]")
        addConstraint("V:[buttonViewHolder(>=100)]")
        addConstraint("H:|-0-[buttonViewHolder(mainThumbViewHolder)]-0-|")
        
        //**Bottom View Holder**/
        
        addConstraint("V:[bottomViewHolder(50)]-|")
        addConstraint("H:|-0-[bottomViewHolder(buttonViewHolder)]-0-|")
        
        NSLayoutConstraint.activateConstraints(constraints)
        
        
        
    }
    
    func addConstraint(format: String) {
        let newConstraint = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: self.views)
        self.constraints += newConstraint
    }
}

