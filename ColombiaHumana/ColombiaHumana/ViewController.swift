//
//  ViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 22/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ""
    let CGenerica = ClaseGenerica()
    
    @IBOutlet weak var BtnMenuBoton: UIBarButtonItem!
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    @IBOutlet weak var Img1: UIImageView!
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Img3: UIImageView!
    @IBOutlet weak var Img4: UIImageView!
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    
    @IBOutlet weak var ViewPuesto: UIView!
    @IBOutlet weak var LabelPuesto: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //BtnMenuBoton.target = revealViewController()
        //BtnMenuBoton.action = "revealToggle:"
        //BtnMenuBoton.action = #selector(SWRevealViewController.revealToggle(_:))
        //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        model = UIDevice.current.modelName
        
        self.ViewPuesto.frame = CGRect(x: 0, y: self.ViewPuesto.frame.origin.y, width: self.view.frame.size.width, height: self.ViewPuesto.frame.size.height)
        self.LabelPuesto.frame = CGRect(x: 10, y: self.ViewPuesto.frame.size.height/2 - self.LabelPuesto.frame.size.height/2 , width: self.view.frame.size.width - 20, height: self.LabelPuesto.frame.size.height)
        
        self.Btn1.frame = CGRect(x: 0, y: self.Img.frame.size.height + self.Img.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.Btn2.frame = CGRect(x: self.Btn1.frame.size.width, y:self.Btn1.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.btn3.frame = CGRect(x: 0, y: self.Btn2.frame.size.height + self.Btn2.frame.origin.y, width: self.view.frame.size.width, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
        
        self.Img1.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Img1.frame.size.width/2, y: self.Btn1.frame.origin.y + self.Btn1.frame.size.height/2 - self.Img1.frame.size.height/2 - 5, width: self.Img1.frame.size.width, height:self.Img1.frame.size.height)
        
        self.Img2.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Img2.frame.size.width/2, y: self.Btn1.frame.origin.y + self.Btn1.frame.size.height/2 - self.Img1.frame.size.height/2 - 10, width: self.Img2.frame.size.width, height:self.Img2.frame.size.height)
        
        self.Img3.frame = CGRect(x: self.btn3.frame.origin.x + self.btn3.frame.size.width/2 - self.Img3.frame.size.width/2, y: self.btn3.frame.origin.y + self.btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10, width: self.Img3.frame.size.width, height:self.Img3.frame.size.height)
        
        self.Label1.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Label1.frame.size.width/2, y: self.Img2.frame.origin.y + self.Img1.frame.size.height + 5, width: self.Label1.frame.size.width, height:self.Label1.frame.size.height)
        
        self.Label2.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Label2.frame.size.width/2, y: self.Img2.frame.origin.y + self.Img2.frame.size.height + 3, width: self.Label2.frame.size.width, height:self.Label2.frame.size.height)
        
        self.Label3.frame = CGRect(x: self.btn3.frame.origin.x + self.btn3.frame.size.width/2 - self.Label3.frame.size.width/2, y: self.Img3.frame.origin.y + self.Img3.frame.size.height + 3, width: self.Label3.frame.size.width, height:self.Label3.frame.size.height)
        
        if(CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Cordinador") != "0"){
            self.Btn4.frame = CGRect(x: 0, y: self.Btn2.frame.size.height + self.Btn2.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
            self.btn3.frame = CGRect(x: self.Btn1.frame.size.width, y:self.Btn2.frame.size.height + self.Btn2.frame.origin.y, width: self.view.frame.size.width/2, height:(self.view.frame.size.height -  self.Img.frame.size.height - self.Img.frame.origin.y)/2)
            
            self.Img4.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Img4.frame.size.width/2, y: self.btn3.frame.origin.y + self.btn3.frame.size.height/2 - self.Img4.frame.size.height/2 - 10, width: self.Img4.frame.size.width, height:self.Img4.frame.size.height)
            self.Img3.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Img3.frame.size.width/2, y: self.btn3.frame.origin.y + self.btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 15, width: self.Img3.frame.size.width, height:self.Img3.frame.size.height)
            
            self.Label4.frame = CGRect(x: self.Btn1.frame.size.width/2 - self.Label1.frame.size.width/2, y: self.Img3.frame.origin.y + self.Img3.frame.size.height + 3, width: self.Label4.frame.size.width, height:self.Label4.frame.size.height)
            self.Label3.frame = CGRect(x: self.Btn2.frame.origin.x + self.Btn2.frame.size.width/2 - self.Label2.frame.size.width/2, y: self.Img3.frame.origin.y + self.Img3.frame.size.height + 3, width: self.Label3.frame.size.width, height:self.Label3.frame.size.height)
            
            self.Btn4.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
            self.Btn4.layer.borderWidth = 1
            self.Btn4.isHidden = false
            self.Label4.isHidden = false
            self.Img4.isHidden = false
            self.ViewPuesto.isHidden = false
        }
               
        if (model == "iPhone 4" || model == "iPad"){
            self.Label1.font = UIFont.boldSystemFont(ofSize: 10)
            self.Label2.font = UIFont.boldSystemFont(ofSize: 10)
            self.Label3.font = UIFont.boldSystemFont(ofSize: 10)
        }else{
             self.Img.frame = CGRect(x: 0, y: self.Img.frame.origin.y, width: self.view.frame.size.width, height:  self.Img.frame.size.height)
        }
        
        self.Btn1.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.Btn2.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.btn3.layer.borderColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.Btn1.layer.borderWidth = 1
        self.Btn2.layer.borderWidth = 1
        self.btn3.layer.borderWidth = 1
        
        self.LabelPuesto.text = "Puesto: " + self.CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Lugar")
        
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
    
    @IBAction func BtnAsistenciaPress(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AsistenciaViewController") as! AsistenciaViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    
    @objc func Ir(){
        let exampleStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleVC = storyboard?.instantiateViewController(withIdentifier: "Inicial") as! UINavigationController
        present(exampleVC, animated: true)
    }
    
    
    @IBAction func Salir(_ sender: Any) {
        let cantidad = Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: "CantidadMesas"))
        let cantidadMesas = cantidad!
        for index in 1...cantidadMesas{
            self.CGenerica.DeletePlist(Nombre: self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))
            self.CGenerica.DeletePlist(Nombre: "Votos" + self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))
            self.CGenerica.DeletePlist(Nombre: "Enviados" + self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))
        }
        self.CGenerica.DeletePlist(Nombre: "Usuario")
        self.CGenerica.DeletePlist(Nombre: "MesasTotalID")
        
        if (self.CGenerica.LeerPlist(Nombre: "Tabla1", Llave: "cantidad") != "0"){
            let totalMesas = Int(self.CGenerica.LeerPlist(Nombre: "Tabla", Llave: "cantidad"))!
            for index in 1...totalMesas{
                self.CGenerica.DeletePlist(Nombre: "Tabla" + String(index))
            }
        }
        self.CGenerica.DeletePlist(Nombre: "MesasTotalNombres")
        self.CGenerica.DeletePlist(Nombre: "Tabla")
        self.Ir()
    }
}

