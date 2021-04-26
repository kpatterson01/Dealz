//
//  HomeViewController.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/10/21.
//

import UIKit
import MapKit
import FloatingPanel





class HomeViewController: UIViewController, FloatingPanelControllerDelegate {
    
    //Mark: properties for MapKit
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    let centerMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "location-arrow-flat" )?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCenterOnUserLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    //Mark: - Selectors
    @objc func handleCenterOnUserLocation() {
        centerMapOnUserLocation()
    }
    
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
        configureMapView()
        configureLocationManager()
        enableLocationServices()
        centerMapOnUserLocation()
        
        
        
        view.addSubview(centerMapButton)
        centerMapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
        centerMapButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        centerMapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.layer.cornerRadius = 50 / 2
        centerMapButton.alpha = 1
        
        //fpc_content
        let fpc = FloatingPanelController()
        fpc.delegate = self
        
        guard let contentVC = storyboard?.instantiateViewController(identifier: "fpc_content") as? ContentViewController else {
            return
        }
        
        fpc.set(contentViewController: contentVC)
        fpc.addPanel(toParent: self)
        
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

    //Mark: Helpter Map Functions
    
    func configureMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        view.addSubview(mapView)
        mapView.frame = view.frame
        
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(region, animated: true)
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    
    func enableLocationServices() {
        
        
        switch CLLocationManager().authorizationStatus {
        
        case .notDetermined:
            print("Location auth status is not determined..")
            locationManager.requestWhenInUseAuthorization()
        case.restricted:
            print("Location auth status is restricted..")
        case.denied:
            print("Location auth status is denied..")
        case.authorizedAlways:
            print("Location auth status is authorized always..")
        case.authorizedWhenInUse:
            print("Location auth status is auth when in use..")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserLocation()
    }
}
