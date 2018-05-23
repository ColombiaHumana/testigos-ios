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
    @IBOutlet weak var ViewBotones: UIView!
    @IBOutlet weak var ViewCamara: UIView!
    
    @IBOutlet weak var BtnCamara: UIButton!
    @IBOutlet weak var LabelCamara: UILabel!
    @IBOutlet weak var BtnEnviar: UIButton!
    @IBOutlet weak var ImagenFoto: UIImageView!
    
    @IBOutlet weak var ScrollViewTabBar: UIScrollView!
    
    var ImgFoto: UIImageView = UIImageView()
    var ref: DatabaseReference!
    let button = UIButton(type: UIButtonType.custom)
    let CGenerica = ClaseGenerica()
    var NumeroMesa = ""
    var token = ""
    var Total: Int? = 0
    var Total2: Int? = 0
    var model = ""
    var widthButton:Double = 0.0
    var heightButton :Double = 0.0
    var cantidadMesas = 0
    var widthScroll :Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token = CGenerica.LeerPlist(Nombre: "Usuario", Llave: "Id")
        ref = Database.database().reference()
        model = UIDevice.current.modelName
        self.Scroll.contentSize.height = 630 + self.ViewBotones.frame.size.height
        self.heightButton = Double(self.ScrollViewTabBar.frame.size.height)
        
        //self.Scroll.frame = CGRect(x: self.Scroll.frame.origin.x , y: self.Scroll.frame.origin.y, width: self.view.frame.size.width, height:  self.view.frame.size.height - self.Scroll.frame.origin.y)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        button.setTitle("Aceptar", for: UIControlState())
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.frame = CGRect(x: 0, y: 163, width: 106, height: 53)
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(PuntajeVotacionViewController.Done(_:)), for: UIControlEvents.touchUpInside)
        
        self.ViewBotones.frame = CGRect(x:0 , y: self.View4.frame.origin.y + 5 , width: self.view.frame.size.width, height: self.ViewBotones.frame.size.height)
        self.BtnEnviar.frame = CGRect(x:8, y: self.ViewBotones.frame.size.height - self.BtnEnviar.frame.size.height - 5, width: self.ViewBotones.frame.size.width - 16, height: self.BtnEnviar.frame.size.height)
        self.ViewCamara.frame = CGRect(x:8 , y:8 , width: self.view.frame.size.width - 16, height: self.ViewCamara.frame.size.height)
        self.BtnCamara.frame = CGRect(x:0, y: self.ViewCamara.frame.size.height - self.BtnCamara.frame.size.height , width: self.ViewCamara.frame.size.width, height: self.BtnCamara.frame.size.height)
        self.ImagenFoto.frame = CGRect(x: self.ViewCamara.frame.size.width/2 - self.ImagenFoto.frame.size.width/2, y: self.ImagenFoto.frame.origin.y, width: self.ImagenFoto.frame.size.width, height: self.ImagenFoto.frame.size.height)
        self.Scroll.frame = CGRect(x:self.Scroll.frame.origin.x , y:self.Scroll.frame.origin.y , width: self.view.frame.size.width, height: self.view.frame.size.height - self.Scroll.frame.origin.y)

        self.ScrollViewTabBar.frame = CGRect(x: 0, y:self.ScrollViewTabBar.frame.origin.y, width:self.view.frame.size.width , height:self.ScrollViewTabBar.frame.size.height )
        
        if (model == "iPhone 4" || model == "iPad"){
            self.ScrollViewTabBar.frame = CGRect(x: self.ScrollViewTabBar.frame.origin.x, y:self.ScrollViewTabBar.frame.origin.y - 10, width:self.view.frame.size.width , height:self.ScrollViewTabBar.frame.size.height )
        }else{
            if(model == "iPhone X"){
                self.ScrollViewTabBar.frame = CGRect(x: 0, y:75, width:self.view.frame.size.width , height:self.ScrollViewTabBar.frame.size.height )
            }
        }
    
        //Nuevo para las mesas
        let cantidad = Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: "CantidadMesas"))
        self.cantidadMesas = cantidad!
        if (self.cantidadMesas >= 3){
            self.widthButton = Double(self.ScrollViewTabBar.frame.size.width/3)
        }else{
            if (self.cantidadMesas == 2 ){
                self.widthButton = Double(self.ScrollViewTabBar.frame.size.width/2)
            }else{
                self.widthButton = Double(self.ScrollViewTabBar.frame.size.width)
            }
        }
        
        for index in 1...self.cantidadMesas{
            let indes = Double(index - 1)
            let a = Double(self.widthButton * indes)
            let btn = UIButton()
            btn.frame = CGRect(x: a , y: 0, width:self.widthButton, height: self.heightButton)
            btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
            btn.setTitle(self.CGenerica.LeerPlist(Nombre: "MesasTotalNombres", Llave: String(index)), for: .normal)
            btn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            btn.tag = Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))!
            self.ScrollViewTabBar.addSubview(btn)
     //       CGenerica.GuardarPlist(Nombre: "Votos" + , Llave: "Prueba", Valor: "Prueba")
        }
        let cmesas = Double(self.cantidadMesas)
        self.widthScroll = Float(Double(self.widthButton * cmesas))
        self.ScrollViewTabBar.contentSize.width = CGFloat(self.widthScroll)
        
        //Actiuvar boton 1 al iniciar
        let tmpButton = self.view.viewWithTag(Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: "1"))!) as? UIButton
        tmpButton?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tmpButton?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        self.NumeroMesa = self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: "1")
        self.MostrarDatos(MesaV: NumeroMesa)
        //Fin activar el boton
        //Fin de nuevo para las mesas
        
        //Accion a la imagen
        let tap = UITapGestureRecognizer(target: self, action: #selector(PuntajeVotacionViewController.ImagenPress))
        ImagenFoto.addGestureRecognizer(tap)
        ImagenFoto.isUserInteractionEnabled = true
        
        self.View1.isHidden = true
        self.View2.isHidden = true
        self.View3.isHidden = true
        self.View4.isHidden = true
        
        self.Label11.textColor = #colorLiteral(red: 0.4078431373, green: 0.1921568627, blue: 0.5490196078, alpha: 1)
        self.Label15.textColor = #colorLiteral(red: 0.4078431373, green: 0.1921568627, blue: 0.5490196078, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func ImagenPress(){
        self.AccionCapturarFoto()
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
                        dict = ["result":["table_id" : self.NumeroMesa, "votes":["total_mesa" :(self.TxtTotalVotosMesa.text as! NSString).integerValue, "petro" :(self.TxtPetro.text as! NSString).integerValue, "promotores" :(self.TxtBlanco.text as! NSString).integerValue, "duque" :(self.TxtDuque.text as! NSString).integerValue, "la_calle" :(self.TxtCalle.text as! NSString).integerValue, "trujillo" :(self.TxtTrujillo.text as! NSString).integerValue, "fajardo" :(self.TxtFajardo.text as! NSString).integerValue, "morales" :(self.TxtViviane.text as! NSString).integerValue, "vargas" :(self.TxtLleras.text as! NSString).integerValue, "votos_validos" :self.Total, "votos_blancos" :(self.TxtPiedad.text as! NSString).integerValue, "votos_nulos" :(self.VotosNulos.text as! NSString).integerValue, "votos_no_marcados" :(self.VotosNoMarcados.text as! NSString).integerValue, "total" : self.Total2],"image": link]]
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
                                self.CGenerica.GuardarPlist(Nombre:"Enviados" + self.NumeroMesa, Llave: "Listo", Valor: "1")
                                
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
        self.AccionCapturarFoto()
    }
    
    func AccionCapturarFoto(){
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
        
        self.Label11.text = "TOTAL VOTOS VALIDOS: \(String(describing: self.Total!))"
        self.Label15.text = "TOTAL VOTOS: \(String(describing: self.Total2!))"
        
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtPetro", Valor: ((self.TxtPetro.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtDuque", Valor: ((self.TxtDuque.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtCalle", Valor: ((self.TxtCalle.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtTrujillo", Valor: ((self.TxtTrujillo.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtFajardo", Valor: ((self.TxtFajardo.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtViviane", Valor: ((self.TxtViviane.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtPiedad", Valor: ((self.TxtPiedad.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtLleras", Valor: ((self.TxtLleras.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotosValidos", Valor: ((self.TotalVotosValidos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotosBlanco", Valor: ((self.TotalVotosBlanco.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "VotosNulos", Valor: ((self.VotosNulos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "VotosNoMarcados", Valor: ((self.VotosNoMarcados.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotos", Valor: ((self.TotalVotos.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtTotalVotosMesa", Valor: ((self.TxtTotalVotosMesa.text as! NSString) as String))
        self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtBlanco", Valor: ((self.TxtBlanco.text as! NSString) as String))
        
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
            self.button.isHidden = true
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
            
            self.Label11.text = "TOTAL VOTOS VALIDOS: \(String(describing: self.Total!))"
            self.Label15.text = "TOTAL VOTOS: \(String(describing: self.Total2!))"
            
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtPetro", Valor: ((self.TxtPetro.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtDuque", Valor: ((self.TxtDuque.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtCalle", Valor: ((self.TxtCalle.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtTrujillo", Valor: ((self.TxtTrujillo.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtFajardo", Valor: ((self.TxtFajardo.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtViviane", Valor: ((self.TxtViviane.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtPiedad", Valor: ((self.TxtPiedad.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtLleras", Valor: ((self.TxtLleras.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotosValidos", Valor: ((self.TotalVotosValidos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotosBlanco", Valor: ((self.TotalVotosBlanco.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "VotosNulos", Valor: ((self.VotosNulos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "VotosNoMarcados", Valor: ((self.VotosNoMarcados.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TotalVotos", Valor: ((self.TotalVotos.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtTotalVotosMesa", Valor: ((self.TxtTotalVotosMesa.text as! NSString) as String))
            self.CGenerica.GuardarPlist(Nombre: "Votos" + self.NumeroMesa, Llave: "TxtBlanco", Valor: ((self.TxtBlanco.text as! NSString) as String))
        }
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
    
    func MostrarDatos(MesaV : String){
        self.LimpiarTxt()
        if "1" == CGenerica.LeerPlist(Nombre: "Enviados" + MesaV, Llave: "Listo"){
            self.DeshabilitarTxt()
        }else{
            self.HabilitarTxt()
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtPetro"){
            self.TxtPetro.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtPetro")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtDuque"){
            self.TxtDuque.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtDuque")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtCalle"){
            self.TxtCalle.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtCalle")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtTrujillo"){
            self.TxtTrujillo.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtTrujillo")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtFajardo"){
            self.TxtFajardo.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtFajardo")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtViviane"){
            self.TxtViviane.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtViviane")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtPiedad"){
            self.TxtPiedad.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtPiedad")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtLleras"){
            self.TxtLleras.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtLleras")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotosValidos"){
            self.TotalVotosValidos.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotosValidos")
            self.Label11.text = "TOTAL VOTOS VALIDOS: \(CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotosValidos"))"
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotosBlanco"){
            self.TotalVotosBlanco.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotosBlanco")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "VotosNulos"){
            self.VotosNulos.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "VotosNulos")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "VotosNoMarcados"){
            self.VotosNoMarcados.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "VotosNoMarcados")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotos"){
            self.TotalVotos.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotos")
            self.Label15.text = "TOTAL VOTOS: \(CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TotalVotos"))"
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtTotalVotosMesa"){
            self.TxtTotalVotosMesa.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtTotalVotosMesa")
        }
        if "0" != CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtBlanco"){
            self.TxtBlanco.text = CGenerica.LeerPlist(Nombre: "Votos" + MesaV, Llave: "TxtBlanco")
        }
        self.Total = (self.TxtPetro.text as! NSString).integerValue + (self.TxtBlanco.text as! NSString).integerValue + (self.TxtDuque.text as! NSString).integerValue + (self.TxtCalle.text as! NSString).integerValue + (self.TxtTrujillo.text as! NSString).integerValue + (self.TxtFajardo.text as! NSString).integerValue + (self.TxtViviane.text as! NSString).integerValue + (self.TxtPiedad.text as! NSString).integerValue + (self.TxtLleras.text as! NSString).integerValue
        self.Total2 = self.Total! + (self.TotalVotosBlanco.text as! NSString).integerValue  + (self.VotosNulos.text as! NSString).integerValue + (self.VotosNoMarcados.text as! NSString).integerValue
    }
    
    func LimpiarTxt(){
        self.TxtPetro.text = ""
        self.TxtDuque.text = ""
        self.TxtCalle.text = ""
        self.TxtTrujillo.text = ""
        self.TxtFajardo.text = ""
        self.TxtViviane.text = ""
        self.TxtPiedad.text = ""
        self.TxtLleras.text = ""
        self.TotalVotosValidos.text = ""
        self.TotalVotosBlanco.text = ""
        self.VotosNulos.text = ""
        self.VotosNoMarcados.text = ""
        self.TotalVotos.text = ""
        self.TxtTotalVotosMesa.text = ""
        self.TxtBlanco.text = ""
        self.Label11.text = "TOTAL VOTOS VALIDOS: 0"
        self.Label15.text = "TOTAL VOTOS: 0"
    }
    
    func DeshabilitarTxt(){
        self.TxtPetro.isEnabled = false
        self.TxtDuque.isEnabled = false
        self.TxtCalle.isEnabled = false
        self.TxtTrujillo.isEnabled = false
        self.TxtFajardo.isEnabled = false
        self.TxtViviane.isEnabled = false
        self.TxtPiedad.isEnabled = false
        self.TotalVotosValidos.isEnabled = false
        self.TotalVotosBlanco.isEnabled = false
        self.VotosNulos.isEnabled = false
        self.VotosNoMarcados.isEnabled = false
        self.TotalVotos.isEnabled = false
        self.TxtTotalVotosMesa.isEnabled = false
        self.TxtBlanco.isEnabled = false
        self.BtnCamara.isEnabled = false
        self.BtnEnviar.isEnabled = false
        self.ImagenFoto.isHidden = true
        
        self.TxtPetro.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtDuque.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtCalle.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtTrujillo.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtFajardo.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtViviane.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtPiedad.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TotalVotosValidos.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TotalVotosBlanco.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.VotosNoMarcados.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.VotosNulos.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TotalVotos.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtBlanco.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtTotalVotosMesa.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.TxtLleras.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func HabilitarTxt(){
        self.TxtPetro.isEnabled = true
        self.TxtDuque.isEnabled = true
        self.TxtCalle.isEnabled = true
        self.TxtTrujillo.isEnabled = true
        self.TxtFajardo.isEnabled = true
        self.TxtViviane.isEnabled = true
        self.TxtPiedad.isEnabled = true
        self.TotalVotosBlanco.isEnabled = true
        self.VotosNulos.isEnabled = true
        self.VotosNoMarcados.isEnabled = true
        self.TxtTotalVotosMesa.isEnabled = true
        self.TxtBlanco.isEnabled = true
        self.BtnCamara.isEnabled = true
        self.BtnEnviar.isEnabled = true
        self.ImagenFoto.isHidden = false
        
        self.TxtPetro.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtDuque.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtCalle.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtTrujillo.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtFajardo.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtViviane.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtPiedad.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TotalVotosBlanco.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.VotosNoMarcados.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.VotosNulos.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtBlanco.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtTotalVotosMesa.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.TxtLleras.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        for index in 1...self.cantidadMesas{
            if(Int(btnsendtag.tag) == Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))){
                NumeroMesa = String(btnsendtag.tag)
                btnsendtag.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
                btnsendtag.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                self.MostrarDatos(MesaV: NumeroMesa)
            }else{
                let tmpButton = self.view.viewWithTag(Int(self.CGenerica.LeerPlist(Nombre: "MesasTotalID", Llave: String(index)))!) as? UIButton
                tmpButton?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                tmpButton?.setTitleColor(#colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1), for: UIControlState.normal)
            }
        }
    }
    
}
