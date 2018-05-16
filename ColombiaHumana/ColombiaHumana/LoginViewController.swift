//
//  LoginViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 23/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ViewHeader: UIView!
    @IBOutlet weak var LogoPetro: UIImageView!
    @IBOutlet weak var LabelCedula: UILabel!
    @IBOutlet weak var LabelClave: UILabel!
    @IBOutlet weak var TxtCedula: UITextField!
    @IBOutlet weak var TxtClave: UITextField!
    @IBOutlet weak var BtnIngresar: UIButton!
    @IBOutlet weak var BtnOlvideClave: UIButton!
    
    let CGenerica = ClaseGenerica()
    var model = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        TxtCedula.delegate = self
        TxtClave.delegate = self
        model = UIDevice.current.modelName

        if (model == "iPhone 4" || model == "iPad"){
            self.ViewHeader.frame = CGRect(x: 0, y: self.ViewHeader.frame.origin.y, width: self.view.frame.size.width, height:  self.ViewHeader.frame.size.height - 100)
            
            self.LogoPetro.frame = CGRect(x: self.view.frame.size.width/2 - (self.LogoPetro.frame.size.width - 70)/2, y: self.LogoPetro.frame.origin.y-40, width: self.LogoPetro.frame.size.width - 70, height:  self.LogoPetro.frame.size.height - 30)
            
            self.LabelCedula.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelCedula.frame.size.width/2, y: self.LabelCedula.frame.origin.y - 110, width: self.LabelCedula.frame.size.width, height:  self.LabelCedula.frame.size.height)
            
            self.LabelClave.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelClave.frame.size.width/2, y: self.LabelClave.frame.origin.y - 140, width: self.LabelClave.frame.size.width, height:  self.LabelClave.frame.size.height)
            
            self.TxtCedula.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtCedula.frame.size.width/2, y: self.TxtCedula.frame.origin.y - 125, width: self.TxtCedula.frame.size.width, height:  self.TxtCedula.frame.size.height)
            
            self.TxtClave.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtClave.frame.size.width/2, y: self.TxtClave.frame.origin.y - 150, width: self.TxtClave.frame.size.width, height:  self.TxtClave.frame.size.height)
            
            self.BtnIngresar.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnIngresar.frame.size.width/2, y: self.BtnIngresar.frame.origin.y - 130, width: self.BtnIngresar.frame.size.width, height:  self.BtnIngresar.frame.size.height)
            
            self.BtnOlvideClave.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnOlvideClave.frame.size.width/2, y: self.BtnOlvideClave.frame.origin.y - 120, width: self.BtnOlvideClave.frame.size.width, height:  self.BtnOlvideClave.frame.size.height)
        }else{
            if (model == "iPhone 6" || model == "iPhone Plus" || model == "iPhone X" || model == "iPhone 5"){
                self.ViewHeader.frame = CGRect(x: 0, y: self.ViewHeader.frame.origin.y, width: self.view.frame.size.width, height:  self.ViewHeader.frame.size.height)
                
                self.LogoPetro.frame = CGRect(x: self.view.frame.size.width/2 - self.LogoPetro.frame.size.width/2, y: self.LogoPetro.frame.origin.y, width: self.LogoPetro.frame.size.width, height:  self.LogoPetro.frame.size.height)
                
                self.LabelCedula.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelCedula.frame.size.width/2, y: self.LabelCedula.frame.origin.y, width: self.LabelCedula.frame.size.width, height:  self.LabelCedula.frame.size.height)
                
                self.LabelClave.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelClave.frame.size.width/2, y: self.LabelClave.frame.origin.y, width: self.LabelClave.frame.size.width, height:  self.LabelClave.frame.size.height)
                
                self.TxtCedula.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtCedula.frame.size.width/2, y: self.TxtCedula.frame.origin.y, width: self.TxtCedula.frame.size.width, height:  self.TxtCedula.frame.size.height)
                
                self.TxtClave.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtClave.frame.size.width/2, y: self.TxtClave.frame.origin.y, width: self.TxtClave.frame.size.width, height:  self.TxtClave.frame.size.height)
                
                self.BtnIngresar.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnIngresar.frame.size.width/2, y: self.BtnIngresar.frame.origin.y, width: self.BtnIngresar.frame.size.width, height:  self.BtnIngresar.frame.size.height)
                
                self.BtnOlvideClave.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnOlvideClave.frame.size.width/2, y: self.BtnOlvideClave.frame.origin.y, width: self.BtnOlvideClave.frame.size.width, height:  self.BtnOlvideClave.frame.size.height)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Ingresar(_ sender: Any) {
        let user = TxtCedula.text
        let pass = TxtClave.text
        
        if (user == nil || user == "" || user == " " || pass == nil || pass == "" || pass == " " ){
            Alerta(titulo: "Error", texto: "Los campos no pueden estar vacios")
            return
        }
        
        var dict = Dictionary<String, Any>()
        dict = ["auth":["email" :user, "password" :pass]]
        //dict = ["auth":["email" :"mike@petro.com.co", "password" :"12345678"]]
        var  jsonData = NSData()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        let url:URL = URL(string: CGenerica.Url()+"/api/user_token")!
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData as Data
        
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.convertToDictionary(text: dataString!)
            //print(dict?["jwt"] as? String ?? "")
            if let jwt = dict?["jwt"]{
                self.CGenerica.GuardarPlist(Nombre: "Usuario", Llave: "Id", Valor: jwt as? String ?? "")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.Ir()
                }
            }else{
                self.Alerta(titulo: "Error", texto: "Usuario o clave incorrecta")
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
    
    @objc func Ir(){
        let exampleStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleVC = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        present(exampleVC, animated: true)
    }
    
    @IBAction func BtnOlvideClavePress(_ sender: Any) {
        
    }
    
    func Alerta(titulo:String, texto:String) {
        let alertController = UIAlertController(title: titulo, message: texto, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated:true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}


