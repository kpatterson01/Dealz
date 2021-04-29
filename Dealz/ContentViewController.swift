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
        
    }
    
    
    lazy var data = [
        "Mcdonald's",
        "Wendy's",
        "Taco Bell",
        "Dunkin Donuts",
        "Pizza Hut",
        "Red Robin",
        "Subway",
        "Tropical Smoothie Cafe",
        "Bajas",
        "Panda Express",
        "Sakura",
        "Burger King"
    ]
    
    lazy var R = Restaurants(locRestaurants: data)
    

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
    

    
    
    

}


