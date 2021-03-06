//
//  MenuViewViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 23/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class MenuViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var LabelPerfil: UILabel!
    @IBOutlet weak var ImgPerfil: UIImageView!
    @IBOutlet weak var ImgHeader: UIImageView!
    @IBOutlet weak var ImgFooter: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var ItemsMenu:Array = [String]()
    var ImgActivas:Array = [String]()
    var ImgDesactivadas:Array = [String]()
    let CGenerica = ClaseGenerica()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 55.0
        if(CGenerica.LeerPlist(Nombre: "Mesitas", Llave: "Listo") != "1"){
            ItemsMenu = ["Testigo electoral", "Resultado de las votaciones", "Reporte de anomalias" ]
            ImgDesactivadas = ["Noticias.png", "Reglamentacion.png" ,"PuntajeVotacion.png"];
        }else{
            ItemsMenu = ["Testigo electoral", "Reporte de anomalias" ]
            ImgDesactivadas = ["Noticias.png","PuntajeVotacion.png"];
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.LabelMenu.text = ItemsMenu[indexPath.row]
        cell.ImgMenu.image = UIImage(named:ImgDesactivadas[indexPath.row])!
        return cell
    }

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if cell.LabelMenu.text == "Testigo electoral" {
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Reglamentacion") as! ComoVotarViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        
        if cell.LabelMenu.text == "Reporte de anomalias" {
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Denunciar") as! DenunciarViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        
        if cell.LabelMenu.text == "Resultado de las votaciones" {
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "PuntajeVotacion") as! PuntajeVotacionViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }

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
