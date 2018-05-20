//
//  ComoVotarViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 23/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class ComoVotarViewController: UIViewController {
    
    @IBOutlet weak var imgPrincipal: UIImageView!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    
    @IBOutlet weak var Img1: UIImageView!
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Img3: UIImageView!
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    @IBOutlet weak var ViewInformacion: UIView!
    @IBOutlet weak var LabelTitulo: UILabel!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var BtnAceptar: UIButton!
    
    var model = ""
    var CGenerica = ClaseGenerica()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
        self.ViewInformacion.frame = CGRect(x: self.view.frame.size.width/2 - self.ViewInformacion.frame.size.width/2, y: self.ViewInformacion.frame.origin.y, width: self.ViewInformacion.frame.size.width, height:  self.ViewInformacion.frame.size.height)
        model = UIDevice.current.modelName
        
        if (model == "iPhone 4" || model == "iPad"){
            Btn1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            Btn2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            Btn3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        }else{
            if( model == "iPhone 5" ){
                self.imgPrincipal.frame = CGRect(x: 0, y: self.imgPrincipal.frame.origin.y, width: self.view.frame.size.width, height:  self.imgPrincipal.frame.size.height - 30)
            }else{
                if(model == "iPhone X"){
                    self.imgPrincipal.frame = CGRect(x: 0, y: self.imgPrincipal.frame.origin.y + 25, width: self.view.frame.size.width, height:  self.imgPrincipal.frame.size.height - 30)
                }else{
                    if(model == "iPhone 6" || model == "iPhone Plus"){
                        self.imgPrincipal.frame = CGRect(x: 0, y: self.imgPrincipal.frame.origin.y, width: self.view.frame.size.width, height:  self.imgPrincipal.frame.size.height)
                    }
                }
            }
        }
        
        self.ViewInformacion.frame = CGRect(x: 4, y: self.ViewInformacion.frame.origin.y, width: self.view.frame.size.width - 8, height:self.view.frame.size.height - 16 - self.ViewInformacion.frame.origin.y)

        self.LabelTitulo.frame = CGRect(x: 4, y:10, width: self.ViewInformacion.frame.size.width - 8, height:self.LabelTitulo.frame.size.height)
        
        self.TextView.frame = CGRect(x: 4, y:self.LabelTitulo.frame.origin.y + 60, width: self.ViewInformacion.frame.size.width - 8, height:self.ViewInformacion.frame.size.height-90 - self.LabelTitulo.frame.origin.y)
        
        self.BtnAceptar.frame = CGRect(x: self.ViewInformacion.frame.width - self.BtnAceptar.frame.width - 10, y: self.TextView.frame.size.height + self.TextView.frame.origin.y + 3, width: self.BtnAceptar.frame.size.width , height:self.BtnAceptar.frame.size.height)
        
        self.Btn1.frame = CGRect(x: 0, y: self.imgPrincipal.frame.size.height + self.imgPrincipal.frame.origin.y, width: self.view.frame.size.width, height:(self.view.frame.size.height -  self.imgPrincipal.frame.size.height - self.imgPrincipal.frame.origin.y)/3 - 2)
        
        self.Btn2.frame = CGRect(x: 0, y: self.Btn1.frame.size.height + self.Btn1.frame.origin.y, width: self.view.frame.size.width, height:(self.view.frame.size.height -  self.imgPrincipal.frame.size.height - self.imgPrincipal.frame.origin.y)/3 - 2)
        
        self.Btn3.frame = CGRect(x: 0, y: self.Btn2.frame.size.height + self.Btn2.frame.origin.y, width: self.view.frame.size.width, height:(self.view.frame.size.height -  self.imgPrincipal.frame.size.height - self.imgPrincipal.frame.origin.y)/3 - 2)
        
        self.Img1.frame = CGRect(x: self.Img1.frame.origin.x, y: self.Btn1.frame.size.height/2 + self.Btn1.frame.origin.y - self.Img1.frame.size.width/2, width: self.Img1.frame.size.width, height:self.Img1.frame.size.height)
        
        self.Img2.frame = CGRect(x: self.Img1.frame.origin.x, y: self.Btn2.frame.size.height/2 + self.Btn2.frame.origin.y - self.Img1.frame.size.width/2, width: self.Img1.frame.size.width,  height:self.Img1.frame.size.height)
        
        self.Img3.frame = CGRect(x: self.Img1.frame.origin.x, y: self.Btn3.frame.size.height/2 + self.Btn3.frame.origin.y - self.Img1.frame.size.width/2, width: self.Img1.frame.size.width,  height:self.Img1.frame.size.height)
        
        self.Label1.frame = CGRect(x: self.Img1.frame.origin.x + self.Img1.frame.size.width + 10, y: self.Btn1.frame.origin.y + self.Btn1.frame.size.height/2 - self.Label1.frame.size.height/2, width: self.view.frame.size.width - self.Img1.frame.origin.x - self.Img1.frame.size.width - 10, height:self.Label1.frame.size.height)
        
        self.Label2.frame = CGRect(x: self.Img1.frame.origin.x + self.Img1.frame.size.width + 10, y: self.Btn2.frame.size.height/2 + self.Btn2.frame.origin.y - self.Label1.frame.size.height/2, width: self.view.frame.size.width - self.Img1.frame.origin.x - self.Img1.frame.size.width - 10, height:self.Label2.frame.size.height)
        
        self.Label3.frame = CGRect(x: self.Img1.frame.origin.x + self.Img1.frame.size.width + 10, y: self.Btn3.frame.size.height/2 + self.Btn3.frame.origin.y - self.Label3.frame.size.height/2, width: self.view.frame.size.width - self.Img1.frame.origin.x - self.Img1.frame.size.width - 5, height:self.Label3.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Btn1Press(_ sender: Any) {
        self.LabelTitulo.text = "10 Recomendaciones para ser un buen testigo electoral"
        self.TextView.text = "1. Llega a tiempo con tu credencial electoral, formatos y esfero\n2. Verifica que los jurados de las mesas correspondan a los asignados por la Registraduría \n3. Verifica que esté completo el Kit electoral\n4. Verifica las urnas con los jurados antes de la apertura del proceso de votación\n5. Verifica que se destruye el material electoral sobrante después del cierre de votaciones\n6. Apunta en la App el número de sufragantes de tu mesa\n7. Vigila la apertura de la urna y el conteo de tarjetas electorales\n8. Se muy cuidadoso en verificar la nivelación de mesa\n9. Debes estar presente en el conteo de votos y digitar los resultados en la APP\n10. Haz las Reclamaciones por escrito en los formatos suministrados por la campaña"
        self.ViewInformacion.isHidden = false
    }
    
    @IBAction func Btn2Press(_ sender: Any) {
        self.LabelTitulo.text = "Cómo reportar los resultados de los escrutinios."
        self.TextView.text = "1. Abre la App y busca la sección: Resultados de las votaciones\n2. En la casilla “Total votos en la mesa” digita el número de votos en la mesa después de la nivelación\n3. Digita el número de votos que obtuvo cada candidato en la casilla frente a cada nombre\n4. Digita el número de votos en blanco, nulos y no marcados en las casillas correspondientes\n5. Si las cifras no corresponden la App emite una alerta de error. \n6. En ese caso verifica con los jurados las cifras o solicita un reconteo de los votos\n7. Envía el reporte\n8. Abre la cámara a través de la App y toma una foto del formulario E14 utilizando las guías en pantalla\n9. Trata de tomar en la foto los tres formularios E14 (Claveros, transmisión y testigos)\n10. Envía la fotografía"
        self.ViewInformacion.isHidden = false
    }
    
    @IBAction func Btn3Press(_ sender: Any) {
        self.LabelTitulo.text = "Cómo reportar anomalías"
        self.TextView.text = "1. Abre la App y busca la sección: Reporte de anomalías durante las votaciones\n\n2. Identifica la Mesa en la que está ocurriendo la anomalía electoral pulsando sobre el número de alguna de las mesas que te fueron asignadas\n\n3. Pulsa sobre la anomalía electoral detectada\n\n4. La aplicación te describe la anomalía y te pregunta si estás seguro que la deseas reportar\n\n5.  Si estás seguro presiona enviar\n\nRecuerda que una anomalía es una situación irregular que puede afectar el normal desarrollo de las votaciones o sus resultados\n\nLas anomalías detectadas también se deben reportar por escrito al delegado de la Registraduría y a los observadores electorales."
        self.ViewInformacion.isHidden = false
    }
    
    @IBAction func BtnAceptarPress(_ sender: Any) {
        self.ViewInformacion.isHidden = true
    }
    
    @IBAction func Volver(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    @objc func Ir(){
        let exampleStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleVC = storyboard?.instantiateViewController(withIdentifier: "Inicial") as! UINavigationController
        present(exampleVC, animated: true)
    }
    
    @IBAction func Salir(_ sender: Any) {
        self.CGenerica.DeletePlist(Nombre: "Usuario")
        self.CGenerica.DeletePlist(Nombre: "MesasTotalID")
        self.CGenerica.DeletePlist(Nombre: "MesasTotalNombres")
        self.CGenerica.DeletePlist(Nombre: "Votos")
        self.Ir()
    }
    
}
