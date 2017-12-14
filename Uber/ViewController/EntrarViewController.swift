//
//  EntrarViewController.swift
//  Uber
//
//  Created by Rodrigo Abreu on 13/12/2017.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var senha: UITextField!
    
    
    @IBAction func entrar(_ sender: Any) {
        
        let retorno = self.validarCampos()
        
        if retorno == ""{
            
            if let emailR = self.email.text{
                if let senhaR = self.senha.text{
                    
                    //Faz autenticacao do usuario (login)
                    let autenticacao = Auth.auth()
                    autenticacao.signIn(withEmail: emailR, password: senhaR, completion: { (usuario, erro) in
                        
                        if erro == nil{
                            
                            //verificar se o usuario esta logado
                            if usuario != nil{
                                
                                self.performSegue(withIdentifier: "segueLogin", sender: nil)
                                
                            }
                            
                            
                            
                        }else{
                            print("Erro ao autenticar o usuario, tente novamente.")
                        }
                        
                        
                    })
                    
                }
            }
            
        }else{
            print("O campo \(retorno) não foi preenchido!")
        }
        
        
        
        
        
    }
    
    
    func validarCampos() -> String {
        
        if (self.email.text?.isEmpty)!{
            return "E-mail"
        }else if (self.senha.text?.isEmpty)!{
            return "Senha"
        }
        
        return ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
