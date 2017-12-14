//
//  PassageiroViewController.swift
//  Uber
//
//  Created by Rodrigo Abreu on 13/12/2017.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import MapKit

class PassageiroViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapa: MKMapView!
    
    //localizacao do usuario
    var gerenciadorLocalizacao = CLLocationManager()
    var localUsuario = CLLocationCoordinate2D()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
    }

    
    
    @IBAction func chamarUber(_ sender: Any) {
        
        let database = Database.database().reference()
        let autenticacao = Auth.auth()
        
        let requisicao = database.child("requisicoes")
        
        if let emailUsuario = autenticacao.currentUser?.email{
            
            let dadosUsuarios = [
                "email":emailUsuario,
                "nome":"Rodrigo Passageiro",
                "latitude":self.localUsuario.latitude,
                "longitude":self.localUsuario.longitude
                ] as [String : Any]
             requisicao.childByAutoId().setValue(dadosUsuarios)
            
        }
        
       
        
       
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Recupera as coordenadas do local atual
        if let coordenadas = manager.location?.coordinate{
            
            //Configura o local atual do usuario
            self.localUsuario = coordenadas
            
            let regiao = MKCoordinateRegionMakeWithDistance(coordenadas, 200, 200)
            mapa.setRegion(regiao, animated: true)
            
            //Remove anotacoes antes de criar
            mapa.removeAnnotations(mapa.annotations)
            
            //Cria anotacao para o local do usuario
            let anotacaoUsuario = MKPointAnnotation()
            anotacaoUsuario.coordinate = coordenadas
            anotacaoUsuario.title = "Seu local"
            mapa.addAnnotation( anotacaoUsuario )
        }
        
        
    }
    
   
    @IBAction func deslogarUsuario(_ sender: Any) {
        
        let autenticacao = Auth.auth()
        
        do{
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        }catch{
            print("Não possivel deslogar!")
        }
        
    }
    

}
