//
//  PassageiroViewController.swift
//  Uber
//
//  Created by Rodrigo Abreu on 13/12/2017.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import FirebaseAuth
import MapKit

class PassageiroViewController: UIViewController {

    @IBOutlet var mapa: MKMapView!
    
    @IBAction func deslogarUsuario(_ sender: Any) {
        
        let autenticacao = Auth.auth()
        
        do{
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        }catch{
            print("Não possivel deslogar!")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
