//
//  AsistenciaViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 19/05/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class AsistenciaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let CGenerica = ClaseGenerica()
    var totalMesas = 0
    var token = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.tableView.rowHeight = 67.0
        totalMesas = Int(self.CGenerica.LeerPlist(Nombre: "Tabla", Llave: "cantidad"))!
        token = CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Id")
        if (totalMesas == 0){
            self.Alerta(titulo: "Error", texto: "No hay testigos asignados")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController().pushFrontViewController(newFrontController, animated: true)
        }
        self.tableView.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height:  self.view.frame.size.height)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalMesas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AsistenciaTableViewCell") as! AsistenciaTableViewCell
        
        let iden = self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "identificacion")
        let name = self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "name")
        let tables = self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "mesas")
        
        if (iden == "<null>"){
            cell.LabelCedula.text = "C.C: ---"
        }else{
            cell.LabelCedula.text = "C.C: " + iden
        }
        if (name == "<null>"){
            cell.LabelNombre.text = "---"
        }else{
            cell.LabelNombre.text = name
        }
        cell.LabelMesas.text = "Mesas: " + tables
        
        if (indexPath.row%2 == 0){
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
            cell.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        }
        
        if (self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "namec") == "1"){
            cell.ImgCheck.image = UIImage(named: "check.png")
        }else{
            cell.ImgCheck.image = UIImage(named: "nocheck.png")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "namec") == "1"){
            return
        }
        let cell =  tableView.cellForRow(at: indexPath) as! AsistenciaTableViewCell
        let idSelect = Int(self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "id"))
        let name = self.CGenerica.LeerPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "name")
        
        let alert = UIAlertController(title: "Confirmación", message: "¿Está seguro que " + name + " asistió al puesto de votación?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default, handler: { action in
            cell.ImgCheck.image = UIImage(named: "check.png")
            var dict = Dictionary<String, Any>()
            dict = ["user":["id" :idSelect]]
            var  jsonData = NSData()
            do {
                jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
            } catch {
                print(error.localizedDescription)
            }
            let url:URL = URL(string: self.CGenerica.Url()+"/api/user")!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer "+self.token, forHTTPHeaderField:"Authorization" )
            request.httpBody = jsonData as Data
            
            let task = session.dataTask(with: request as URLRequest) {(
                data, response, error) in
                guard let data = data, let _:URLResponse = response, error == nil else {
                    print("error")
                    return
                }
                let dataString =  String(data: data, encoding: String.Encoding.utf8)
                let dict = self.convertToDictionary(text: dataString!)
                if let jwt = dict?["ok"]{
                    self.CGenerica.GuardarPlist(Nombre: "Tabla" + String(indexPath.row + 1), Llave: "namec", Valor: "1")
                    self.Alerta(titulo: "Información", texto: "Asistencia confirmada")
                }
            }
            task.resume()
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:{ action in
            cell.ImgCheck.image = UIImage(named: "nocheck.png")
            }))
        self.present(alert, animated: true, completion: nil)
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
    
    func Alerta(titulo:String, texto:String) {
        let alertController = UIAlertController(title: titulo, message: texto, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated:true)
    }
    
}
