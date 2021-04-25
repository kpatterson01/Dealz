//
//  HomeViewController.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    var sideMenu = UIImageView()
    var button = UIImageView()
    var sideMenu_isHidden = Bool()
    
    //Menu title
    var name = UILabel()
    var profile = UILabel()
    var star = UILabel()
    var recent = UILabel()
    var setting = UILabel()
    
    var pref = UILabel()
    var headShot = UIImageView()
    var closeMenu = UILabel()
    
    @IBOutlet weak var menuBtn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetupButton()
        SideMenu()
    }
    

    func SetupButton() {
        /*button.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.0), size: CGSize(width: view.frame.width / 4.5, height: view.frame.height / 10))
        button.center = CGPoint(x: view.frame.width * 0.85, y: view.frame.height * 0.15)*/
        menuBtn.clipsToBounds = true
        //button.image = UIImage(systemName: "list.dash")
        menuBtn.isUserInteractionEnabled = true
        menuBtn.alpha = 1.0
        //button.layer.cornerRadius = button.frame.height / 2
        //button.backgroundColor = UIColor.red
        view.insertSubview(menuBtn, at: 0)
        view.bringSubviewToFront(menuBtn)
    }
    
    
    func SideMenu() {
        sideMenu.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.0), size: CGSize(width: view.frame.width / 2, height: view.frame.height))
        sideMenu.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.5)
        sideMenu.clipsToBounds = true
        sideMenu.isUserInteractionEnabled = true
        sideMenu.alpha = 1.0
        sideMenu.backgroundColor = UIColor.black
        view.insertSubview(sideMenu, at: 0)
        view.bringSubviewToFront(sideMenu)
        
        headShot.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.1), size: CGSize(width: view.frame.width / 4.5, height: view.frame.height / 10))
        
        headShot.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.15)
        headShot.clipsToBounds = true
        headShot.image = UIImage(named:"profile-icon")
        headShot.isUserInteractionEnabled = true
        headShot.alpha = 1.0
        //button.layer.cornerRadius = button.frame.height / 2
        //button.backgroundColor = UIColor.red
        view.insertSubview(headShot, at: 0)
        view.bringSubviewToFront(headShot)
        
        name.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.0), size: CGSize(width: view.frame.width / 2, height: view.frame.height/2))
        name.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.25)
        name.text = "Dylan Scott"
        name.textColor = UIColor.white
        view.insertSubview(name, at: 1)
        view.bringSubviewToFront(name)
        
        profile.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.05), size: CGSize(width: view.frame.width / 2, height: view.frame.height/2))
        profile.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.3)
        profile.text = "Profile"
        profile.textColor = UIColor.white
        view.insertSubview(profile, at: 1)
        view.bringSubviewToFront(profile)
        
        star.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.1), size: CGSize(width: view.frame.width / 2, height: view.frame.height/2))
        star.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.35)
        star.text = "Starred"
        star.textColor = UIColor.white
        view.insertSubview(star, at: 1)
        view.bringSubviewToFront(star)
        
        recent.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.15), size: CGSize(width: view.frame.width / 2, height: view.frame.height/2))
        recent.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.4)
        recent.text = "Recent"
        recent.textColor = UIColor.white
        view.insertSubview(recent, at: 1)
        view.bringSubviewToFront(recent)
        
        setting.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.20), size: CGSize(width: view.frame.width / 2, height: view.frame.height/2))
        setting.center = CGPoint(x: view.frame.width * -0.5, y: view.frame.height * 0.45)
        setting.text = "Settings"
        setting.textColor = UIColor.white
        view.insertSubview(setting, at: 1)
        view.bringSubviewToFront(setting)
        
        closeMenu.frame = CGRect(origin: CGPoint(x: view.frame.width * 0.0, y: view.frame.height * 0.1), size: CGSize(width: view.frame.width / 2, height: view.frame.height+500))
        closeMenu.text = "Close Menu"
        closeMenu.textColor = UIColor.white
        view.insertSubview(closeMenu, at: 2)
        view.bringSubviewToFront(closeMenu)

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
       
        
        if touch.view == menuBtn {
            UIView.transition(with: menuBtn, duration: 0.2, animations: {
                self.menuBtn.alpha = 0.5
            }, completion: { (finished: Bool) -> () in
                UIView.transition(with: self.menuBtn, duration: 0.2, animations: {
                    self.menuBtn.alpha = 1.0
                    }, completion: { (finished: Bool) -> () in
                    if self.sideMenu_isHidden == true {
                        self.sideMenu_isHidden = false
                        UIView.transition(with: self.sideMenu, duration: 1.0, animations: {
                            self.sideMenu.center.x = self.view.frame.width * -0.5
                            self.headShot.center.x = self.view.frame.width * -0.5
                            self.name.center.x = self.view.frame.width * -0.5
                            self.profile.center.x = self.view.frame.width * -0.5
                            self.star.center.x = self.view.frame.width * -0.5
                            self.recent.center.x = self.view.frame.width * -0.5
                            self.setting.center.x = self.view.frame.width * -0.5
                        })
                    } else {
                        self.sideMenu_isHidden = true
                        UIView.transition(with: self.sideMenu, duration: 1.0, animations: {
                            self.sideMenu.center.x = self.view.frame.width * 0.25
                            self.headShot.center.x = self.view.frame.width * 0.25
                            self.name.center.x = self.view.frame.width * 0.25
                            self.profile.center.x = self.view.frame.width * 0.25
                            self.star.center.x = self.view.frame.width * 0.25
                            self.recent.center.x = self.view.frame.width * 0.25
                            self.setting.center.x = self.view.frame.width * 0.25
                        })
                    }
                })
            }) //end of first
        } //end of if
    }

}
