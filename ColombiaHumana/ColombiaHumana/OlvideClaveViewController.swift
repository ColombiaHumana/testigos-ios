//
//  OlvideClaveViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 30/04/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class OlvideClaveViewController: UIViewController {

    @IBOutlet weak var ViewHeader: UIView!
    @IBOutlet weak var LogoHeader: UIImageView!
    @IBOutlet weak var LabelHeader: UILabel!
    @IBOutlet weak var TxtCorreo: UITextField!
    @IBOutlet weak var BtnEnviar: UIButton!
    @IBOutlet weak var LabelHelp: UILabel!
    
    let CGenerica = ClaseGenerica()
    var model = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = UIDevice.current.modelName
        
        if (model == "iPhone 4" || model == "iPad"){
            self.ViewHeader.frame = CGRect(x: 0, y: self.ViewHeader.frame.origin.y, width: self.view.frame.size.width, height:  self.ViewHeader.frame.size.height - 80)
            
            self.LogoHeader.frame = CGRect(x: self.view.frame.size.width/2 - (self.LogoHeader.frame.size.width - 50)/2, y: self.LogoHeader.frame.origin.y-30, width: self.LogoHeader.frame.size.width - 50, height:  self.LogoHeader.frame.size.height - 20)
            
            self.LabelHeader.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelHeader.frame.size.width/2, y: self.LabelHeader.frame.origin.y - 90, width: self.LabelHeader.frame.size.width, height:  self.LabelHeader.frame.size.height)
            
            self.TxtCorreo.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtCorreo.frame.size.width/2, y: self.TxtCorreo.frame.origin.y - 100, width: self.TxtCorreo.frame.size.width, height:  self.TxtCorreo.frame.size.height)
            
            self.LabelHelp.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelHelp.frame.size.width/2, y: self.LabelHelp.frame.origin.y - 100, width: self.LabelHelp.frame.size.width, height:  self.LabelHelp.frame.size.height)
            
            self.BtnEnviar.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnEnviar.frame.size.width/2, y: self.BtnEnviar.frame.origin.y - 50, width: self.BtnEnviar.frame.size.width, height:  self.BtnEnviar.frame.size.height)

        }else{
            if (model == "iPhone 6" || model == "iPhone Plus" || model == "iPhone X" || model == "iPhone 5" ){
                self.ViewHeader.frame = CGRect(x: 0, y: self.ViewHeader.frame.origin.y, width: self.view.frame.size.width, height:  self.ViewHeader.frame.size.height)
                
                self.LogoHeader.frame = CGRect(x: self.view.frame.size.width/2 - self.LogoHeader.frame.size.width/2, y: self.LogoHeader.frame.origin.y, width: self.LogoHeader.frame.size.width, height:  self.LogoHeader.frame.size.height)
                
                self.LabelHeader.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelHeader.frame.size.width/2, y: self.LabelHeader.frame.origin.y, width: self.LabelHeader.frame.size.width, height:  self.LabelHeader.frame.size.height)
                
                self.BtnEnviar.frame = CGRect(x: self.view.frame.size.width/2 - self.BtnEnviar.frame.size.width/2, y: self.BtnEnviar.frame.origin.y, width: self.BtnEnviar.frame.size.width, height:  self.BtnEnviar.frame.size.height)
                
                self.TxtCorreo.frame = CGRect(x: self.view.frame.size.width/2 - self.TxtCorreo.frame.size.width/2, y: self.TxtCorreo.frame.origin.y, width: self.TxtCorreo.frame.size.width, height:  self.TxtCorreo.frame.size.height)
                
                self.LabelHelp.frame = CGRect(x: self.view.frame.size.width/2 - self.LabelHelp.frame.size.width/2, y: self.LabelHelp.frame.origin.y , width: self.LabelHelp.frame.size.width, height:  self.LabelHelp.frame.size.height)
            }
        }
        self.LabelHelp.textAlignment = .justified
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BtnVolverPress(_ sender: Any) {
        
    }
    
    @IBAction func BtnEnviarPress(_ sender: Any) {
        self.view.endEditing(true)
        var Correo = ""
        Correo = TxtCorreo.text!
        if (Correo == nil || Correo == "" || Correo == " "){
            self.Alerta(titulo: "Error", texto: "Ingrese un correo")
            return
        }
        
        var dict = Dictionary<String, Any>()
        dict = ["password_reset":["email" : Correo]]
        var  jsonData = NSData()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        let url:URL = URL(string: CGenerica.Url()+"/api/password_reset")!
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
            print(dict)
            if let _ = dict?["ok"]{
                self.TxtCorreo.text = ""
                self.Alerta(titulo: "Información", texto: "Las instrucciones se enviaron al correo electronico.")
            }else{
                self.Alerta(titulo: "Error", texto: "No se pudo reestablecer la clave.")
            }
        }
        task.resume()
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
    
}
