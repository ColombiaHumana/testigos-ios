//
//  PuntajeVotacionViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 29/04/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class PuntajeVotacionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITabBarDelegate {
    
    @IBOutlet weak var TxtTotalVotosMesa: UITextField!
    
    @IBOutlet weak var TotalVotosValidos: UITextField!
    @IBOutlet weak var TotalVotos: UITextField!
    
    @IBOutlet weak var TotalVotosBlanco: UITextField!
    @IBOutlet weak var VotosNulos: UITextField!
    @IBOutlet weak var VotosNoMarcados: UITextField!
    
    @IBOutlet weak var TxtPetro: UITextField!
    @IBOutlet weak var TxtBlanco: UITextField!
    @IBOutlet weak var TxtDuque: UITextField!
    @IBOutlet weak var TxtCalle: UITextField!
    @IBOutlet weak var TxtTrujillo: UITextField!
    @IBOutlet weak var TxtFajardo: UITextField!
    @IBOutlet weak var TxtViviane: UITextField!
    @IBOutlet weak var TxtPiedad: UITextField!
    @IBOutlet weak var TxtLleras: UITextField!
    
    @IBOutlet weak var Label15: UILabel!
    @IBOutlet weak var Label14: UILabel!
    @IBOutlet weak var Label13: UILabel!
    @IBOutlet weak var Label12: UILabel!
    @IBOutlet weak var Label11: UILabel!
    @IBOutlet weak var Label10: UILabel!
    @IBOutlet weak var Label9: UILabel!
    @IBOutlet weak var Label8: UILabel!
    @IBOutlet weak var Label7: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    
    @IBOutlet weak var Scroll: UIScrollView!
    @IBOutlet weak var TabBar: UITabBar!
    @IBOutlet weak var ViewBotones: UIView!
    @IBOutlet weak var ViewCamara: UIView!
    
    @IBOutlet weak var BtnCamara: UIButton!
    @IBOutlet weak var LabelCamara: UILabel!
    @IBOutlet weak var BtnEnviar: UIButton!
    @IBOutlet weak var ImagenFoto: UIImageView!
    
    @IBOutlet weak var ItemUno: UITabBarItem!
    @IBOutlet weak var ItemDos: UITabBarItem!
    @IBOutlet weak var ItemTres: UITabBarItem!
    
    @IBOutlet weak var ViewTabBar: UIView!
    @IBOutlet weak var ViewItem1: UIButton!
    @IBOutlet weak var ViewItem2: UIButton!
    @IBOutlet weak var ViewItem3: UIButton!
    
    var ImgFoto: UIImageView = UIImageView()
    var ref: DatabaseReference!
    let button = UIButton(type: UIButtonType.custom)
    let CGenerica = ClaseGenerica()
    var NumeroMesa = ""
    var token = ""
    var llave:[String] = []
    var llave1:[String] = []
    var Total: Int? = 0
    var Total2: Int? = 0
    var model = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        llave = ["Id0", "Id1", "Id2"]
        llave1 = ["N0", "N1", "N2"]
        token = CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Id")
        ref = Database.database().reference()
        self.Peticion()
        
        self.Scroll.frame = CGRect(x: self.Scroll.frame.origin.x , y: self.Scroll.frame.origin.y, width: self.view.frame.size.width, height:  self.Scroll.frame.size.height)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        button.setTitle("Aceptar", for: UIControlState())
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.frame = CGRect(x: 0, y: 163, width: 106, height: 53)
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(PuntajeVotacionViewController.Done(_:)), for: UIControlEvents.touchUpInside)
        
        self.ViewBotones.frame = CGRect(x:0 , y: self.view.frame.size.height - self.ViewBotones.frame.size.height , width: self.view.frame.size.width, height: self.ViewBotones.frame.size.height)
         self.BtnEnviar.frame = CGRect(x:8, y: self.ViewBotones.frame.size.height - self.BtnEnviar.frame.size.height - 5, width: self.ViewBotones.frame.size.width - 16, height: self.BtnEnviar.frame.size.height)
        self.ViewCamara.frame = CGRect(x:8 , y:8 , width: self.view.frame.size.width - 16, height: self.ViewCamara.frame.size.height)
        self.BtnCamara.frame = CGRect(x:0, y: self.ViewCamara.frame.size.height - self.BtnCamara.frame.size.height , width: self.ViewCamara.frame.size.width, height: self.BtnCamara.frame.size.height)
        self.ImagenFoto.frame = CGRect(x: self.ViewCamara.frame.size.width/2 - self.ImagenFoto.frame.size.width/2, y: self.ImagenFoto.frame.origin.y, width: self.ImagenFoto.frame.size.width, height: self.ImagenFoto.frame.size.height)
        self.Scroll.frame = CGRect(x:self.Scroll.frame.origin.x , y:self.Scroll.frame.origin.y , width: self.view.frame.size.width, height: self.view.frame.size.height - self.Scroll.frame.origin.y - self.ViewBotones.frame.size.height)
        
       
        
        self.Scroll.contentSize.height = 630
        
        model = UIDevice.current.modelName
        
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
        
        if (model == "iPhone 4" || model == "iPad"){
            self.ViewTabBar.frame = CGRect(x: self.ViewTabBar.frame.origin.x, y:self.ViewTabBar.frame.origin.y - 10, width:self.view.frame.size.width , height:self.ViewTabBar.frame.size.height )
        }else{
            if(model == "iPhone X"){
                self.ViewTabBar.frame = CGRect(x: 0, y:75, width:self.view.frame.size.width , height:self.ViewTabBar.frame.size.height )
            }
        }
        CGenerica.GuardarPlist(Nombre: "Votos", Llave: "Prueba", Valor: "Prueba")
        
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtPetro"){
            self.TxtPetro.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtPetro")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtDuque"){
            self.TxtDuque.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtDuque")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtCalle"){
            self.TxtCalle.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtCalle")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtTrujillo"){
            self.TxtTrujillo.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtTrujillo")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtFajardo"){
            self.TxtFajardo.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtFajardo")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtViviane"){
            self.TxtViviane.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtViviane")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtPiedad"){
            self.TxtPiedad.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtPiedad")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtLleras"){
            self.TxtLleras.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtLleras")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotosValidos"){
            self.TotalVotosValidos.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotosValidos")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotosBlanco"){
            self.TotalVotosBlanco.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotosBlanco")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "VotosNulos"){
            self.VotosNulos.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "VotosNulos")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "VotosNoMarcados"){
            self.VotosNoMarcados.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "VotosNoMarcados")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotos"){
            self.TotalVotos.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TotalVotos")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtTotalVotosMesa"){
            self.TxtTotalVotosMesa.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtTotalVotosMesa")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtBlanco"){
            self.TxtBlanco.text = CGenerica.LeerPlist(Nombre: "Votos", Llave: "TxtBlanco")
        }
        self.Total = (self.TxtPetro.text as! NSString).integerValue + (self.TxtBlanco.text as! NSString).integerValue + (self.TxtDuque.text as! NSString).integerValue + (self.TxtCalle.text as! NSString).integerValue + (self.TxtTrujillo.text as! NSString).integerValue + (self.TxtFajardo.text as! NSString).integerValue + (self.TxtViviane.text as! NSString).integerValue + (self.TxtPiedad.text as! NSString).integerValue + (self.TxtLleras.text as! NSString).integerValue
        self.Total2 = self.Total! + (self.TotalVotosBlanco.text as! NSString).integerValue  + (self.VotosNulos.text as! NSString).integerValue + (self.VotosNoMarcados.text as! NSString).integerValue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func Enviar(_ sender: Any) {
        
        let alert = UIAlertController(title: "Confirmación", message: "¿Desea enviar los datos suministrados?", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Enviar", style: UIAlertActionStyle.default, handler: { action in
           
            if (self.NumeroMesa == ""){
                self.Alerta(titulo: "Error", texto: "Seleccione una mesa")
                return
            }
            
            if(self.TotalVotos.text == nil || self.TotalVotos.text == ""){
                self.Alerta(titulo: "Error", texto: "Por favor ingrese los valores")
                return
            }
            
            if let _ = self.ImgFoto.image{
                if ((self.TxtTotalVotosMesa.text as! NSString).integerValue == self.Total2){
                    let store = Storage.storage()
                    let metadata = StorageMetadata()
                    let imageData: Data = UIImageJPEGRepresentation(self.ImgFoto.image!, 0.5)!
                    metadata.contentType = "image/jpeg"
                    let llave = self.ref.child("Prueba").childByAutoId().key
                    let storeRef = store.reference().child("images/" + llave)
                    let _ = storeRef.putData(imageData, metadata: metadata) { (metadata, error) in
                        guard let _ = metadata else {
                            print("error occurred: \(error.debugDescription)")
                            return
                        }
                        let pat = (metadata?.downloadURL())!
                        let link = String(describing :pat)
                        
                        var dict = Dictionary<String, Any>()
                        dict = ["result":["table_id" : self.NumeroMesa, "votes":["total_mesa" :(self.TxtTotalVotosMesa.text as! NSString).integerValue, "petro" :(self.TxtPetro.text as! NSString).integerValue, "promotores" :(self.TxtBlanco.text as! NSString).integerValue, "duque" :(self.TxtDuque.text as! NSString).integerValue, "la_calle" :(self.TxtCalle.text as! NSString).integerValue, "trujillo" :(self.TxtTrujillo.text as! NSString).integerValue, "fajardo" :(self.TxtFajardo.text as! NSString).integerValue, "morales" :(self.TxtViviane.text as! NSString).integerValue, "piedad" :(self.TxtPiedad.text as! NSString).integerValue, "vargas" :(self.VotosNoMarcados.text as! NSString).integerValue, "votos_validos" :self.Total, "votos_blancos" :(self.TotalVotosBlanco.text as! NSString).integerValue, "votos_nulos" :(self.VotosNulos.text as! NSString).integerValue, "votos_no_marcados" :(self.VotosNoMarcados.text as! NSString).integerValue, "total" : self.Total2],"image": link]]
                        var  jsonData = NSData()
                        do {
                            jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
                        } catch {
                            print(error.localizedDescription)
                        }
                        let url:URL = URL(string: self.CGenerica.Url()+"/api/results")!
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
                            print(dict)
                            if let _ = dict?["ok"]{
                                self.Limpiar()
                                let alert = UIAlertController(title:"Información", message: "Guardado con exito.", preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.destructive, handler: { action in
                                    self.perform(#selector(self.Ir), with: nil, afterDelay: 0.1)
                                }))
                                self.present(alert, animated: true, completion: nil)
                                
                                //Para borrar el icono cuando se envie el reporte a todas las mesas este CGenerica.GuardarPlist(Nombre: (self.CGenerica.LeerPlist(Nombre: "Mesitas", Llave: "Listo", Valor: "1") debe tomar el valor de 1
                                
                                //self.CGenerica.GuardarPlist(Nombre:"Mesitas", Llave: "Listo", Valor: "1")
                                
                            }else{
                                self.Alerta(titulo: "Error", texto: "No se pudo realizar la operación.")
                            }
                        }
                        task.resume()
                    }
                }else{
                    self.Alerta(titulo: "Error", texto: "El total de votos en la mesa y el total de votos no son iguales.")
                }
            }else{
                self.Alerta(titulo: "Error", texto: "Por favor adjunte la imagen")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func SeleccionarFoto(_ sender: Any) {
        let alert = UIAlertController(title: "Información", message: "A continuación podra seleccionar la imagen que desea enviar con el reporte.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tomar Foto", style: UIAlertActionStyle.default, handler: { action in
            self.TomarFoto()
        }))
        alert.addAction(UIAlertAction(title: "Buscar en galeria", style: UIAlertActionStyle.default, handler:{ action in
            self.FotoGaleria()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func Volver(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    //Metodos para la toma  captura de la foto
    func TomarFoto(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            imagePicker.accessibilityLanguage = "es-co"
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func FotoGaleria(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        ImgFoto.image = newImage
        ImagenFoto.image = newImage
        dismiss(animated: true)
    }
    
    func Alerta(titulo:String, texto:String) {
        let alertController = UIAlertController(title: titulo, message: texto, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated:true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.Total = (self.TxtPetro.text as! NSString).integerValue + (self.TxtBlanco.text as! NSString).integerValue + (self.TxtDuque.text as! NSString).integerValue + (self.TxtCalle.text as! NSString).integerValue + (self.TxtTrujillo.text as! NSString).integerValue + (self.TxtFajardo.text as! NSString).integerValue + (self.TxtViviane.text as! NSString).integerValue + (self.TxtPiedad.text as! NSString).integerValue + (self.TxtLleras.text as! NSString).integerValue
        self.TotalVotosValidos.text = "\(String(describing: self.Total!))"
        self.Total2 = self.Total! + (self.TotalVotosBlanco.text as! NSString).integerValue  + (self.VotosNulos.text as! NSString).integerValue + (self.VotosNoMarcados.text as! NSString).integerValue
        self.TotalVotos.text = "\(String(describing: self.Total2!))"
        
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPetro", Valor: ((self.TxtPetro.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtDuque", Valor: ((self.TxtDuque.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtCalle", Valor: ((self.TxtCalle.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTrujillo", Valor: ((self.TxtTrujillo.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtFajardo", Valor: ((self.TxtFajardo.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtViviane", Valor: ((self.TxtViviane.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPiedad", Valor: ((self.TxtPiedad.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtLleras", Valor: ((self.TxtLleras.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosValidos", Valor: ((self.TotalVotosValidos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosBlanco", Valor: ((self.TotalVotosBlanco.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNulos", Valor: ((self.VotosNulos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNoMarcados", Valor: ((self.VotosNoMarcados.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotos", Valor: ((self.TotalVotos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTotalVotosMesa", Valor: ((self.TxtTotalVotosMesa.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtBlanco", Valor: ((self.TxtBlanco.text as! NSString) as String))
        
        NotificationCenter.default.addObserver(self, selector: #selector(PuntajeVotacionViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func Limpiar(){
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPetro", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtDuque", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtCalle", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTrujillo", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtFajardo", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtViviane", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPiedad", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtLleras", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosValidos", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosBlanco", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNulos", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNoMarcados", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotos", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTotalVotosMesa", Valor: "0")
        self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtBlanco", Valor: "0")
    }
    
    @objc func keyboardWillShow(_ note : Notification) -> Void{
        DispatchQueue.main.async { () -> Void in
            self.button.isHidden = false
            let keyBoardWindow = UIApplication.shared.windows.last
            self.button.frame = CGRect(x: 0, y: (keyBoardWindow?.frame.size.height)!-53, width: 106, height: 53)
            keyBoardWindow?.addSubview(self.button)
            keyBoardWindow?.bringSubview(toFront: self.button)
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey) as AnyObject).doubleValue)!, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                self.view.frame = self.view.frame.offsetBy(dx: 0, dy: 0)
            }, completion: { (complete) -> Void in
                //print("Complete")
            })
        }
    }
    
    @objc func Done(_ sender : UIButton){
        DispatchQueue.main.async { () -> Void in
            self.TxtTotalVotosMesa.resignFirstResponder()
            self.TotalVotosValidos.resignFirstResponder()
            self.TotalVotos.resignFirstResponder()
            self.TotalVotosBlanco.resignFirstResponder()
            self.VotosNulos.resignFirstResponder()
            self.VotosNoMarcados.resignFirstResponder()
            
            self.TxtPetro.resignFirstResponder()
            self.TxtBlanco.resignFirstResponder()
            self.TxtDuque.resignFirstResponder()
            self.TxtCalle.resignFirstResponder()
            self.TxtTrujillo.resignFirstResponder()
            self.TxtFajardo.resignFirstResponder()
            self.TxtViviane.resignFirstResponder()
            self.TxtPiedad.resignFirstResponder()
            self.TxtLleras.resignFirstResponder()
            
            self.Total = (self.TxtPetro.text as! NSString).integerValue + (self.TxtBlanco.text as! NSString).integerValue + (self.TxtDuque.text as! NSString).integerValue + (self.TxtCalle.text as! NSString).integerValue + (self.TxtTrujillo.text as! NSString).integerValue + (self.TxtFajardo.text as! NSString).integerValue + (self.TxtViviane.text as! NSString).integerValue + (self.TxtPiedad.text as! NSString).integerValue + (self.TxtLleras.text as! NSString).integerValue
            self.TotalVotosValidos.text = "\(String(describing: self.Total!))"
            self.Total2 = self.Total! + (self.TotalVotosBlanco.text as! NSString).integerValue  + (self.VotosNulos.text as! NSString).integerValue + (self.VotosNoMarcados.text as! NSString).integerValue
            self.TotalVotos.text = "\(String(describing: self.Total2!))"
            
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPetro", Valor: ((self.TxtPetro.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtDuque", Valor: ((self.TxtDuque.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtCalle", Valor: ((self.TxtCalle.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTrujillo", Valor: ((self.TxtTrujillo.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtFajardo", Valor: ((self.TxtFajardo.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtViviane", Valor: ((self.TxtViviane.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtPiedad", Valor: ((self.TxtPiedad.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtLleras", Valor: ((self.TxtLleras.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosValidos", Valor: ((self.TotalVotosValidos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotosBlanco", Valor: ((self.TotalVotosBlanco.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNulos", Valor: ((self.VotosNulos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "VotosNoMarcados", Valor: ((self.VotosNoMarcados.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TotalVotos", Valor: ((self.TotalVotos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtTotalVotosMesa", Valor: ((self.TxtTotalVotosMesa.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos", Llave: "TxtBlanco", Valor: ((self.TxtBlanco.text as! NSString) as String))
        }
    }
    
    @IBAction func ViewItem1Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[0])
        self.ViewItem1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func WebItem2Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[1])
        self.ViewItem2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem2.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem3.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func ViewItem3Press(_ sender: Any) {
        NumeroMesa = self.CGenerica.LeerPlist(Nombre: "Mesa", Llave: llave[2])
        self.ViewItem3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.ViewItem3.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.ViewItem2.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.ViewItem1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func Ir(){
        let exampleStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleVC = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        present(exampleVC, animated: true)
    }
    
}
