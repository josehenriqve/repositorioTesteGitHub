//
//  CadastroviewViewController.swift
//  teste1
//
//  Created by Pede o Menu on 04/01/22.
//
import UIKit
import FirebaseFirestore

class CadastroviewViewController: UIViewController {
 
    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var idadeField: UITextField?
    @IBOutlet weak var labelTelaCadastro: UINavigationItem!
    @IBOutlet weak var botaoTelaCadastro: UIButton!
    @IBOutlet weak var navigation: UINavigationItem!
    
    var enviar: String = ""
    var firebase: Firestore?
    var cliente: Cliente!
    var clienteDAO: ClienteDao!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebase = Firestore.firestore()
        clienteDAO = .init()
        verificaEdicaoeCadastro()
    }
    
    func showAlert(titulo: String, mensagem: String) {
        
      let alertController = UIAlertController(title: titulo, message:mensagem, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in
            self.nameField?.text = ""
            self.idadeField?.text = ""
            self.nameField?.becomeFirstResponder()
            self.performSegue(withIdentifier: "viewControllerSegue", sender: nil)
      }))
        
      self.present(alertController, animated: true, completion: nil)
    }
    
    func verificaEdicaoeCadastro() {
        if let clienteSetado = cliente {
            labelTelaCadastro.title = "Editar cliente"
            botaoTelaCadastro.setTitle("Salvar", for: .normal)
            nameField?.text = clienteSetado.getNome()
            idadeField?.text = String(clienteSetado.getIdade())
        }
    }
    
    @IBAction func cadastrarCliente(_ sender: Any) {
       
        if let nome = nameField?.text, let idade = idadeField?.text {
            
            if !nome.trimmingCharacters(in: .whitespaces).isEmpty, !idade.trimmingCharacters(in: .whitespaces).isEmpty{
                
                
                if cliente.getId() != "" {
                    cliente = Cliente(nome: nome, idade: Int(idade) ?? 0, id: cliente?.getId() ?? "", favorito:cliente.getFavorito())
                    clienteDAO.editarCliente(cliente: cliente)
                    
                } else {
                    cliente = Cliente(nome: nome, idade: Int(idade) ?? 0, id: cliente?.getId() ?? "", favorito:false)
                    clienteDAO.cadastrar(cliente: cliente)
                }
            } else {
                
                self.showAlert(titulo: "Falha", mensagem: "É obrigatorio o preenchimento de todos os campos!")
            }
        }
    }
    
    /*
    func cadastrarCliente() {
       
        firebase?.collection("clientes").addDocument(data:cliente.map()) { (error) in
                
            if error != nil {
                self.showAlert(titulo: "Erro", mensagem: "Erro ao cadastrar o cliente")
                
            } else {
                self.showAlert(titulo: "Sucesso", mensagem: "O Cliente foi cadastrado com sucesso!")
                
            }
        }
    }
     */
    
     /*
    func editarCliente () {
        firebase?.collection("clientes").document(cliente.getId()).setData(cliente.map()) { (error) in
                
            if error != nil {
                self.showAlert(titulo: "Erro", mensagem: "Erro ao editar o Cliente")
                
            } else {
                self.showAlert(titulo: "Sucesso", mensagem: "Todas as alterações do cliente foram salvas")
                
            }
        }
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
   
}
