//
//  ViewController.swift
//  Uber
//
//  Created by Rodrigo Abreu on 08/12/2017.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let autenticacao = Auth.auth()
        
        
        
        
        
        
        autenticacao.addStateDidChangeListener { (autenticacao, usuario) in
            
            if let usuarioLogado = usuario{
                
                self.performSegue(withIdentifier: "segueLoginPrincipal", sender: nil)
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

}

