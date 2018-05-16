//
//  ClaseGenerica.swift
//  JustGo.Dm
//
//  Created by Daniel Muñoz Melendez on 7/03/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import Foundation

class ClaseGenerica {
    
    func GuardarPlist(Nombre: String, Llave: String, Valor: String) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let fileManager = FileManager.default
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(Nombre + ".plist")
        
        if(!fileManager.fileExists(atPath: path)){
            let documentsDirectory = paths.object(at: 0) as! NSString
            let path = documentsDirectory.appendingPathComponent(Nombre + ".plist")
            let dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
            dict.setObject(Valor, forKey: Llave as NSCopying)
            dict.write(toFile: path, atomically: false)
        }
        else{
            let myDict = NSMutableDictionary(contentsOfFile: path)
            myDict?.setObject(Valor ?? "", forKey: Llave as NSCopying)
            myDict?.write(toFile: path, atomically: false)
        }
    }
    
    func LeerPlist(Nombre: String, Llave: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(Nombre + ".plist")
        let fileManager = FileManager.default
        
        if(!fileManager.fileExists(atPath: path)){
            if let bundlePath = Bundle.main.path(forResource: Nombre, ofType: "plist"){
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                //print("Descripción --> \(resultDictionary?.description)")
                do{
                    try fileManager.copyItem(atPath: bundlePath, toPath: path)
                }
                catch _ {
                    print("No se pudo cargar la información")
                }
            }
            else{
                print("No se encontro el archivo .plist")
                return "0"
            }
        }
        
        let myDict = NSDictionary(contentsOfFile: path)
        //print(myDict ?? "")
        if let dict = myDict {
            if let a = dict.object(forKey: Llave){
                return dict.object(forKey: Llave) as! String  ?? ""
            }else{
                return "0"
            }
        }
        return ""
    }
    
    func Url() -> String {
        return "https://testigos-app.petro.com.co"
    }
    
    func Peticion(Path : String, dict: Dictionary<String, Any>) -> String {
       
        return ""
    }
    
    func HoraOFecha(Tipo:String) -> String {
        if (Tipo=="H"){
            print("Envia Hora")
        }else{
            if (Tipo=="F"){
                print("Envia Fecha")
            }else{
                print("Envia ambas")
            }
        }
        return ""
    }
}
public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPhone 5"
        case "iPod7,1":                                 return "iPhone 5"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone Plus"
        case "iPhone8,1":                               return "iPhone 6"
        case "iPhone8,2":                               return "iPhone Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 6"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone Plus"
        case "iPhone8,4":                               return "iPhone 5"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 6"
        case "iPhone10,2", "iPhone10,5":                return "iPhone Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad"
        case "iPad5,3", "iPad5,4":                      return "iPad"
        case "iPad6,11", "iPad6,12":                    return "iPad"
        case "iPad7,5", "iPad7,6":                      return "iPad"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad"
        case "iPad5,1", "iPad5,2":                      return "iPad"
        case "iPad6,3", "iPad6,4":                      return "iPad"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro"
        case "iPad7,3", "iPad7,4":                      return "iPad"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "iPad"//simulator
        default:                                        return identifier
        }
    }
}
