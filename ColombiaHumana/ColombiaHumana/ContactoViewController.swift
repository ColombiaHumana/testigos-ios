//
//  ContactoViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 23/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class ContactoViewController: UIViewController {

    @IBOutlet weak var IconoHeader: UIImageView!
    @IBOutlet weak var ViewHeader: UIImageView!
    @IBOutlet weak var BtnFacebook: UIButton!
    @IBOutlet weak var BtnTwitter: UIButton!
    @IBOutlet weak var BtnInstagram: UIButton!
    @IBOutlet weak var BtnCorreo: UIButton!
    @IBOutlet weak var LabelFacebook: UILabel!
    @IBOutlet weak var LabelTwitter: UILabel!
    @IBOutlet weak var LabelInstagram: UILabel!
    @IBOutlet weak var LabelCorreo: UILabel!
    @IBOutlet weak var ImgFooter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Volver(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    @IBAction func BtnFacebookPress(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "http://www.facebook.com/GustavoPetroUrrego")! as URL)
    }
    
    @IBAction func BtnTwitterPress(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "http://www.twitter.com/petrogustavo")! as URL)
    }
    
    @IBAction func BtnInstagramPress(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "http://www.instagram.com/gustavopetrourrego")! as URL)
    }
    
    @IBAction func BtnCorreoPress(_ sender: Any) {
        let email = "petro@presidente.com.co"
        let url = URL(string: "mailto:\(email)")
        UIApplication.shared.openURL(url!)
    }
    
    
}
