//
//  ButtonViewController.swift
//  Dealz
//
//  Created by Dylan Scott on 4/17/21.
//

import UIKit

class ButtonViewController: UIViewController {
    
    
    struct deals {
        
        
        var dealz: [String] = []
        
    }
    
    var mcdonaldsDealz = [ "Big mac meal\t\t\t\t\t\t$1.00",
                           "20 Nuggets\t\t\t\t\t\t$5.00",
                           "buy 1 sandwhich get 2 free\t\t$4.00",
                           "2 Apple pies\t\t\t\t\t\t$1.00",
                           "1 Mcflurry\t\t\t\t\t\t\t$1.00",
                           "Large Fry\t\t\t\t\t\t\t$1.00",
                           "2 Crispy Chicken Sandwhiches\t$7.00",
                           
    ]
    
    lazy var mcdeal = deals(dealz: mcdonaldsDealz)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mcdeal.dealz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dealzTableView.dequeueReusableCell(withIdentifier: "dealzCell", for: indexPath)
        cell.textLabel?.text = mcdeal.dealz[indexPath.row]
        return cell
        
    }
    
    
    @IBOutlet weak var dealzTableView: UITableView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dealzTableView.delegate = self
        dealzTableView.dataSource = self
        
        // Do any additional setup after loading the view.
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

extension ButtonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("YOU SELECTED A CELL")
    }
}
