//
//  ViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 22/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BtnMenuBoton: UIBarButtonItem!
    var model = ""
    let CGenerica = ClaseGenerica()
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var Img1: UIImageView!
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Img3: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnMenuBoton.target = revealViewController()
        BtnMenuBoton.action = "revealToggle:"        
        BtnMenuBoton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        model = UIDevice.current.modelName
        
        self.Btn1.frame = CGRect(x: 0, y: self.Img.frame.size.height + self.Img.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.Btn2.frame = CGRect(x: self.Btn1.frame.size.width, y:self.Btn1.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.btn3.frame = CGRect(x: 0, y: self.Btn2.frame.size.height + self.Btn2.frame.origin.y, width: self.view.frame.size.width, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.Img1.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Img1.frame.size.width/2, y: self.Btn1.frame.origin.y + self.Btn1.frame.size.height/2 - self.Img1.frame.size.height/2 - 5, width: self.Img1.frame.size.width, height:self.Img1.frame.size.height)
        
        self.Img2.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Img2.frame.size.width/2, y: self.Btn1.frame.origin.y + self.Btn1.frame.size.height/2 - self.Img1.frame.size.height/2 - 10, width: self.Img2.frame.size.width, height:self.Img2.frame.size.height)
        
        self.Img3.frame = CGRect(x: self.btn3.frame.origin.x + self.btn3.frame.size.width/2 - self.Img3.frame.size.width/2, y: self.btn3.frame.origin.y + self.btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10, width: self.Img3.frame.size.width, height:self.Img3.frame.size.height)
        
        self.Label1.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Label1.frame.size.width/2, y: self.Img2.frame.origin.y + self.Img1.frame.size.height + 5, width: self.Label1.frame.size.width, height:self.Label1.frame.size.height)
        
        self.Label2.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Label2.frame.size.width/2, y: self.Img2.frame.origin.y + self.Img2.frame.size.height + 3, width: self.Label2.frame.size.width, height:self.Label2.frame.size.height)
        
        self.Label3.frame = CGRect(x: self.btn3.frame.origin.x + self.btn3.frame.size.width/2 - self.Label3.frame.size.width/2, y: self.Img3.frame.origin.y + self.Img3.frame.size.height + 3, width: self.Label3.frame.size.width, height:self.Label3.frame.size.height)

               
        if (model == "iPhone 4" || model == "iPad"){
            self.Label1.font = UIFont.boldSystemFont(ofSize: 10)
            self.Label2.font = UIFont.boldSystemFont(ofSize: 10)
            self.Label3.font = UIFont.boldSystemFont(ofSize: 10)
        }else{
             self.Img.frame = CGRect(x: 0, y: self.Img.frame.origin.y, width: self.view.frame.size.width, height:  self.Img.frame.size.height)
        }
        
        if(CGenerica.LeerPlist(Nombre: "Mesitas", Llave: "Listo") == "1"){
            btn3.isHidden = true
            btn3.isEnabled = false
        }
        
        self.Btn1.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.Btn2.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.btn3.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.Btn1.layer.borderWidth = 1
        self.Btn2.layer.borderWidth = 1
        self.btn3.layer.borderWidth = 1
        
        if(CGenerica.LeerPlist(Nombre: "Mesitas", Llave: "Listo") == "1"){
            self.btn3.isHidden = true
            self.Label3.isHidden = true
            self.Img3.isHidden = true
            self.btn3.isEnabled = false
            self.Label3.isEnabled = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BtnTestigoPress(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Reglamentacion") as! ComoVotarViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    @IBAction func BtnAnomaliasPress(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Denunciar") as! DenunciarViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    @IBAction func BtnResultadoPress(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "PuntajeVotacion") as! PuntajeVotacionViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
}

