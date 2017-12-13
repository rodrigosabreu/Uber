//
//  CadastroViewController.swift
//  Uber
//
//  Created by Rodrigo Abreu on 13/12/2017.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var nomeCompleto: UITextField!
    @IBOutlet var senha: UITextField!
    @IBOutlet var tipoUsuario: UISwitch!
    
    @IBAction func cadastrarUsuario(_ sender: Any) {
        
        let retorno = self.validarCampos()
        
        if retorno == ""{

            //cadastrar o usuario no Firebase
            let autenticacao = Auth.auth()
            
            if let emailR = self.email.text{
                if let senhaR = self.senha.text{
                    autenticacao.createUser(withEmail: emailR, password: senhaR, completion: { (usuario, erro) in
                        
                        if erro == nil{
                            print("Sucesso ao criar conta do usuário")
                        }else{
                            print("Erro ao criar conta do usuário, tente novamente.")
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
        }else if (self.nomeCompleto.text?.isEmpty)!{
            return "Nome Completo"
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
