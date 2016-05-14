//
//  ViewController.swift
//  tareaHTTP
//
//  Created by Nicolas Roman Toro on 5/11/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textoISBN: UITextField!
    @IBOutlet weak var textoRespuesta: UITextView!
    var textoDisplay: String?
    
    @IBOutlet weak var textoTitulo: UITextView!
    @IBOutlet weak var textoAutores: UITextView!
    @IBOutlet weak var portadaLibro: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Actions
    func sincrono(isbn:String) {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+isbn
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        textoDisplay = String(texto)
        
        // Consultar JSON para extraer Título, Autores, Portada
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
            let dico1 = json as! NSDictionary
            let dico2 = dico1["ISBN:"+textoISBN.text!] as! NSDictionary
            
            textoTitulo.text = dico2["title"] as! NSString as String
            print(textoTitulo.text)
            
            let dico3 = dico2["authors"] as! NSArray as Array
            print(dico3[0])
            let dico4 = dico3[0] as! NSDictionary
            
            textoAutores.text = dico4["name"] as! NSString as String

        }
        catch _ {
        }
    }
    
    @IBAction func buscaISBN(sender: UITextField) {
        sincrono(textoISBN.text!)
        textoRespuesta.text = textoDisplay
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

