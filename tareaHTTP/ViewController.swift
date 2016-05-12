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
    
    // Funciones
    
    func sincrono(isbn:String) {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+isbn
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        textoDisplay = String(texto)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textoRespuesta.text = "Acá se mostrará el texto del ISBN"
    }
    
    // MARK: Actions
    @IBAction func buscaISBN(sender: UITextField) {
        sincrono(textoISBN.text!)
        textoRespuesta.text = textoDisplay
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

