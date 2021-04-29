//
//  ContentViewController.swift
//  Dealz
//
//  Created by Dylan Scott on 4/25/21.
//

import UIKit

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    struct Restaurants {
        
        var locRestaurants: [String] = []
        var resDealz = deals()
        
    }
    
    struct deals {
        
        
        var dealz: [String] = []
        
    }
    
    var mcdonaldsDealz = [ "Big mac meal 1.00",
                           "20 Nuggets  5.00",
                           "buy 1 sandwhich get 2 free 4.00"
    ]
    
    lazy var data = [
        "Mcdonald's",
        "Wendy's",
        "Taco Bell",
        "Dunkin Donuts",
        "Pizza Hut",
        "Red Robin",
        "Subway"
    ]
    
    lazy var R = Restaurants(locRestaurants: data, resDealz: deals(dealz: mcdonaldsDealz ))
    

    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return R.locRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = R.locRestaurants[indexPath.row]
        
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    lazy var bc = ButtonViewController(items: R.resDealz.dealz)
    
    
    

}


