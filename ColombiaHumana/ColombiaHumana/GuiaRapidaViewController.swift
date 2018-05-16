//
//  GuiaRapidaViewController.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 29/04/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class GuiaRapidaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.368627451, green: 0.1921568627, blue: 0.4274509804, alpha: 1)
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

}
