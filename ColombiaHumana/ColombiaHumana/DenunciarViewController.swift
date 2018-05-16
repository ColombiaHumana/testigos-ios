//
//  DenunciarViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 29/04/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class DenunciarViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var ItemTres: UITabBarItem!
    @IBOutlet weak var ItemDos: UITabBarItem!
    @IBOutlet weak var ItemUno: UITabBarItem!
    @IBOutlet weak var ViewPrincipal: UIView!
    @IBOutlet weak var TabBar: UITabBar!
    
    @IBOutlet weak var ViewTabBar: UIView!
    @IBOutlet weak var ViewItem1: UIButton!
    @IBOutlet weak var ViewItem2: UIButton!
    @IBOutlet weak var ViewItem3: UIButton!
    
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var Btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var Btn8: UIButton!
    
    @IBOutlet weak var Img1: UIImageView!
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Img3: UIImageView!
    @IBOutlet weak var Img4: UIImageView!
    @IBOutlet weak var Img5: UIImageView!
    @IBOutlet weak var Img6: UIImageView!
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    
    let CGenerica = ClaseGenerica()
    var NumeroMesa = ""
    var Tipo = ""
    var token = ""
    var llave:[String] = []
    var llave1:[String] = []
    var model = ""
    var activa = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        llave = ["Id0", "Id1", "Id2"]
        llave1 = ["N0", "N1", "N2"]
        token = CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Id")
        self.Peticion()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        model = UIDevice.current.modelName
        
        // self.ViewPrincipal.frame = CGRect(x: self.view.frame.size.width/2 - self.ViewPrincipal.frame.size.width/2, y: self.ViewPrincipal.frame.origin.y, width: self.ViewPrincipal.frame.size.width, height:  self.ViewPrincipal.frame.size.height )
        
        self.ViewTabBar.frame = CGRect(x: self.ViewTabBar.frame.origin.x, y:self.ViewTabBar.frame.origin.y, width:self.view.frame.size.width , height:self.ViewTabBar.frame.size.height )
        self.ViewItem1.frame = CGRect(x: 0, y: 0, width:self.ViewTabBar.frame.size.width/3 , height:self.ViewTabBar.frame.size.height )
        self.ViewItem2.frame = CGRect(x: self.ViewItem1.frame.size.width, y: 0, width:self.ViewTabBar.frame.size.width/3 , height:self.ViewTabBar.frame.size.height )
        self.ViewItem3.frame = CGRect(x: self.ViewItem2.frame.size.width + self.ViewItem2.frame.origin.x, y: 0, width:self.ViewTabBar.frame.size.width/3 , height:self.ViewTabBar.frame.size.height )
        
        self.ViewItem1.setTitle(self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave1[0]), for: .normal)
        self.ViewItem2.setTitle(self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave1[1]), for: .normal)
        self.ViewItem3.setTitle(self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave1[2]), for: .normal)
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[0])
        self.ViewItem1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.ValidarDenunciaMesaUno(Mesa: "Id0")
        
        if (model == "iPhone 4" || model == "iPad"){
            self.ViewTabBar.frame = CGRect(x: self.ViewTabBar.frame.origin.x, y:self.ViewTabBar.frame.origin.y - 10, width:self.view.frame.size.width , height:self.ViewTabBar.frame.size.height )
        }else{
            if(model == "iPhone X"){
                self.ViewTabBar.frame = CGRect(x: 0, y:75, width:self.view.frame.size.width , height:self.ViewTabBar.frame.size.height )
            }
        }
        
        self.ViewPrincipal.frame = CGRect(x:0, y: self.ViewTabBar.frame.origin.y + self.ViewTabBar.frame.size.height , width: self.view.frame.size.width, height:  self.view.frame.size.height - self.ViewTabBar.frame.size.height - self.ViewTabBar.frame.origin.y)
      
        self.Btn3.frame = CGRect(x: 0, y: 0, width: self.ViewPrincipal.frame.size.width/2, height:self.ViewPrincipal.frame.size.height / 3)
        self.Btn4.frame = CGRect(x: self.Btn3.frame.size.width, y:0, width: self.ViewPrincipal.frame.size.width/2, height: self.ViewPrincipal.frame.size.height / 3)
        
        self.Btn5.frame = CGRect(x: 0, y: self.Btn3.frame.size.height + self.Btn3.frame.origin.y, width: self.ViewPrincipal.frame.size.width/2, height:self.ViewPrincipal.frame.size.height / 3)
        self.Btn6.frame = CGRect(x: self.Btn3.frame.size.width, y:self.Btn3.frame.size.height + self.Btn3.frame.origin.y, width: self.ViewPrincipal.frame.size.width/2, height: self.ViewPrincipal.frame.size.height / 3)
        
        self.btn7.frame = CGRect(x: 0, y: self.Btn5.frame.size.height + self.Btn5.frame.origin.y, width: self.ViewPrincipal.frame.size.width/2, height:self.ViewPrincipal.frame.size.height / 3)
        self.Btn8.frame = CGRect(x: self.Btn5.frame.size.width, y:self.Btn5.frame.size.height + self.Btn5.frame.origin.y, width: self.ViewPrincipal.frame.size.width/2, height: self.ViewPrincipal.frame.size.height / 3)
        
        self.Img1.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y: self.Btn3.frame.size.height/2 - 10 - self.Img1.frame.size.height/2, width: self.Img1.frame.size.width, height:self.Img1.frame.size.height)
        self.Img2.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y:self.Btn3.frame.size.height/2 - 10 - self.Img1.frame.size.height/2, width: self.Img1.frame.size.width, height: self.Img1.frame.size.height)
        
        self.Img3.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y:self.Btn5.frame.origin.y + self.Btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10 , width: self.Img1.frame.size.width, height:self.Img1.frame.size.height)
        self.Img4.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y:self.Btn5.frame.origin.y + self.Btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10, width: self.Img1.frame.size.width, height: self.Img1.frame.size.height)
        
        self.Img5.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y:self.btn7.frame.origin.y + self.Btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10, width: self.Img4.frame.size.width, height:self.Img1.frame.size.height)
        self.Img6.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Img1.frame.size.width/2, y:self.btn7.frame.origin.y + self.Btn3.frame.size.height/2 - self.Img3.frame.size.height/2 - 10 , width: self.Img1.frame.size.width, height: self.Img1.frame.size.height)
        
        self.Label1.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Label1.frame.size.width/2, y:self.Img1.frame.origin.y + self.Img1.frame.size.height + 5, width: self.Label1.frame.size.width, height:self.Label1.frame.size.height)
        self.Label2.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Label1.frame.size.width/2, y:self.Img1.frame.origin.y + self.Img1.frame.size.height + 5, width: self.Label2.frame.size.width, height: self.Label2.frame.size.height)
        
        self.Label3.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Label3.frame.size.width/2, y:self.Img3.frame.origin.y + self.Img3.frame.size.height + 5, width: self.Label3.frame.size.width, height:self.Label3.frame.size.height)
        self.Label4.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Label4.frame.size.width/2, y:self.Img3.frame.origin.y + self.Img3.frame.size.height + 5, width: self.Label4.frame.size.width, height: self.Label4.frame.size.height)
        
        self.Label5.frame = CGRect(x: self.Btn3.frame.size.width/2 - self.Label5.frame.size.width/2, y:self.Img5.frame.origin.y + self.Img5.frame.size.height + 5, width: self.Label5.frame.size.width, height:self.Label5.frame.size.height)
        self.Label6.frame = CGRect(x: self.Btn3.frame.size.width + self.Btn3.frame.size.width/2 - self.Label6.frame.size.width/2, y:self.Img5.frame.origin.y + self.Img5.frame.size.height + 5, width: self.Label6.frame.size.width, height: self.Label6.frame.size.height)
        
        self.Btn3.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.Btn4.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.Btn5.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.Btn6.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.btn7.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.Btn8.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.Btn3.layer.borderWidth = 1
        self.Btn4.layer.borderWidth = 1
        self.Btn5.layer.borderWidth = 1
        self.Btn6.layer.borderWidth = 1
        self.btn7.layer.borderWidth = 1
        self.Btn8.layer.borderWidth = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func ValidarDenunciaMesaUno(Mesa: String){
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "1") == "1"){
            Btn3.isEnabled = false
            Img1.image = UIImage(named: "check.png")
            Btn3.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            Btn3.isEnabled = true
            Img1.image = UIImage(named: "nocheck.png")
            Btn3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "2") == "1"){
            Btn4.isEnabled = false
            Img2.image = UIImage(named: "check.png")
            Btn4.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            Btn4.isEnabled = true
            Img2.image = UIImage(named: "nocheck.png")
            Btn4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "3") == "1"){
            Btn5.isEnabled = false
            Img3.image = UIImage(named: "check.png")
            Btn5.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            Btn5.isEnabled = true
            Img3.image = UIImage(named: "nocheck.png")
            Btn5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "4") == "1"){
            Btn6.isEnabled = false
            Img4.image = UIImage(named: "check.png")
            Btn6.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            Btn6.isEnabled = true
            Img4.image = UIImage(named: "nocheck.png")
            Btn6.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "5") == "1"){
            btn7.isEnabled = false
            Img5.image = UIImage(named: "check.png")
            btn7.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            btn7.isEnabled = true
            Img5.image = UIImage(named: "nocheck.png")
            btn7.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if(CGenerica.LeerPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: Mesa)), Llave: "6") == "1"){
            Btn8.isEnabled = false
            Img6.image = UIImage(named: "check.png")
            Btn8.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else{
            Btn8.isEnabled = true
            Img6.image = UIImage(named: "nocheck.png")
            Btn8.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    @IBAction func Volver(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    func Peticion (){
        let url:URL = URL(string: CGenerica.Url()+"/api/user")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization" )
        
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.convertToDictionary(text: dataString!)
            if let _ = dict?["user"]{
                let Resultado = dict?["user"] as! NSDictionary
                let mesas = Resultado["tables"] as! NSArray
                for a in 0...2{
                    let b = String(format: "%@", (mesas[a] as! NSDictionary)["id"]! as! CVarArg)
                    self.CGenerica.GuardarPlist(Nombre: "Mesa", Llave: self.llave[a], Valor: b)
                    self.CGenerica.GuardarPlist(Nombre: "Mesa", Llave:  self.llave1[a], Valor: (mesas[a] as! NSDictionary)["name"]! as! String)
                }
                //self.ViewItem1.setTitle((mesas[0] as! NSDictionary)["name"]! as? String, for: .normal)
                //self.ViewItem2.setTitle((mesas[1] as! NSDictionary)["name"]! as? String, for: .normal)
                //self.ViewItem3.setTitle((mesas[2] as! NSDictionary)["name"]! as? String, for: .normal)
            }else{
                self.Alerta(titulo: "Error", texto: "No hay mesas")
            }
        }
        task.resume()
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /*
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 0){
            NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[0])
        }
        if (item.tag == 1){
            NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[1])
        }
        if (item.tag == 2){
            NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[2])
        }
    }*/
    
    @IBAction func ViewItem1Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[0])
        self.ValidarDenunciaMesaUno(Mesa: "Id0")
        self.ViewItem1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func WebItem2Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[1])
        self.ValidarDenunciaMesaUno(Mesa: "Id1")
        self.ViewItem2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem2.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func ViewItem3Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[2])
        self.ValidarDenunciaMesaUno(Mesa: "Id2")
        self.ViewItem3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem3.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func Btn3(_ sender: Any) {
        Tipo = "1"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        Btn3.isEnabled = false
        Btn3.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img1.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "Jurados de votación", texto: "Está a punto de reportar la suplantación de jurados de votación o la presencia de jurados no registrados en la mesa elegida")
    }
    
    @IBAction func Btn4(_ sender: Any) {
        Tipo = "2"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        Btn4.isEnabled = false
        Btn4.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img2.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "Limitaciones al derecho al voto", texto: "Está a punto de reportar una o varias circunstancias que impiden el libre derecho al voto o el voto secreto")
    }
    
    @IBAction func Btn5(_ sender: Any) {
        Tipo = "3"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        Btn5.isEnabled = false
        Btn5.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img3.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "Votación extemporánea", texto: "Está a punto de reportar que en la mesa elegida se depositaron votos en la urna después del cierre de las votaciones a las 4PM.")
    }
    
    @IBAction func Btn6(_ sender: Any) {
        Tipo = "4"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        Btn6.isEnabled = false
        Btn6.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img4.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "No destrucción del material electoral", texto: " Está a punto de reportar que en la mesa elegida no se destruyó todo o parte del material electoral sobrante")
    }
    
    @IBAction func Btn7(_ sender: Any) {
        Tipo = "5"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        btn7.isEnabled = false
        btn7.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img5.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "Errores en el conteo", texto: "Está a punto de reportar que en la mesa elegida no se hizo nivelación de mesa, se destruyeron votos válidos u otras irregularidades en el conteo de los votos")
    }
    
    @IBAction func Btn8(_ sender: Any) {
        Tipo = "6"
        self.CGenerica.GuardarPlist(Nombre: NumeroMesa, Llave: Tipo, Valor: "1")
        Btn8.isEnabled = false
        Btn8.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        Img6.image = UIImage(named: "check.png")
        self.Alerta2(titulo: "Errores en el formato E14", texto: "Está a punto de reportar que en los formatos E14 de la mesa elegida contienen errores que pueden modificar los resultados electorales")
    }
    
    func Alerta(titulo:String, texto:String) {
        let alertController = UIAlertController(title: titulo, message: texto, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated:true)
    }
    
    func Alerta2(titulo:String, texto:String){
        let alert = UIAlertController(title:titulo, message: texto, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.destructive, handler: { action in
            self.perform(#selector(self.Accion), with: nil, afterDelay: 0.1)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func Accion() {
        Enviar()
    }
    
    func Enviar (){
        if (NumeroMesa == ""){
            self.Alerta(titulo: "Error", texto: "Seleccione una mesa")
            return
        }
        
        var dict = Dictionary<String, Any>()
        dict = ["report":["issue_id" :Tipo, "table_id" : NumeroMesa]]
        var  jsonData = NSData()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        let url:URL = URL(string: CGenerica.Url()+"/api/issue")!
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization" )
        request.httpBody = jsonData as Data
        
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.convertToDictionary(text: dataString!)
            if let _ = dict?["ok"]{
                let aaa = dict?["issue"] as! NSDictionary
                let mensaje = "Se reporto la incidencia " + (aaa["name"] as? String ?? "") + " en la mesa " + self.NumeroMesa
                print(mensaje)
                self.Alerta(titulo: "Información", texto: mensaje)
            }else{
                self.Alerta(titulo: "Error", texto: "El reporte no se pudo enviar.")
            }
        }
        task.resume()
    }
    
}
