//
//  ViewController.swift
//  teste1
//
//  Created by Pede o Menu on 03/01/22.
//
import UIKit

class ListaClientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imagem: UIImageView!
    
    @IBOutlet weak var fffa: UIImageView!
    @IBOutlet weak var TablewView: UITableView!
    @IBOutlet weak var Container: UIView!
    @IBOutlet weak var Botao: UIButton!
    
    var listaClientes: [Cliente] = []
    var clienteDAO: ClienteDao!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        clienteDAO = .init()
        TablewView.separatorStyle = .none
        TablewView.allowsSelection = true
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        listaClientes.removeAll()
        atualizarDados()
    }
    
    func atualizarDados() {
        listaClientes.removeAll()
        clienteDAO.pegarClientes { (Clientes) in
            self.listaClientes = Clientes
            self.TablewView.reloadData()
            self.ordernar()
        }
    }
    
    func ordernar(){
        
        self.listaClientes.sort{ (Cliente, Cliente2) in
        
            return (Cliente.getNome().lowercased() < Cliente2.getNome().lowercased())
            
        }
        
        self.listaClientes.sort{ (Cliente, Cliente2) in
            
            return (Cliente.getFavorito())
        
        }
        
        self.listaClientes.sort{ (Cliente, Cliente2) in
            
            return (Cliente.getFavorito() && Cliente.getNome().lowercased() < Cliente2.getNome().lowercased())
        
        }
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            
            var listaClientesAux = self.listaClientes.remove(at: indexPath.row)
            self.listaClientes.removeAll()
            self.listaClientes.append(listaClientesAux)
            self.performSegue(withIdentifier: "segueEdit", sender: nil)
            
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            self.clienteDAO.remover(id: self.listaClientes[indexPath.row].getId())
            
            self.listaClientes.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        
        editAction.backgroundColor = UIColor(red: 0.51, green: 0.76, blue: 0.78, alpha: 1.00)
        return [deleteAction,editAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaClientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaDeReuso", for: indexPath) as! ClienteTableViewCelula
        let dadosClientes = self.listaClientes[indexPath.row]
        if dadosClientes.getFavorito() {
            celula.labelNome.text = "\(dadosClientes.getNome()) - \(dadosClientes.getIdade()) \(verificaIadade(idade:dadosClientes.getIdade()))"
            celula.favoritoEstrela.isHidden = false
            return celula
        } else {
            celula.labelNome.text = "\(dadosClientes.getNome()) - \(dadosClientes.getIdade()) \(verificaIadade(idade:dadosClientes.getIdade()))"
            celula.favoritoEstrela.isHidden = true
            return celula
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueEdit" {
            
            let vcDestino = segue.destination as! CadastroviewViewController
            let clienteEnviar: Cliente = Cliente(nome: listaClientes[0].getNome(), idade: listaClientes[0].getIdade(), id: listaClientes[0].getId(),favorito: listaClientes[0].getFavorito())
            vcDestino.cliente = clienteEnviar
        }
    }
    
    
    func verificaIadade(idade: Int) -> String{
        return idade == 1 ? "ano": "anos"
    }
    
    @IBAction func unwindToController1(segue: UIStoryboardSegue) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let listaClientesAux = self.listaClientes.remove(at: indexPath.row)
        self.listaClientes.removeAll()
        self.listaClientes.append(listaClientesAux)
        clienteDAO.salvarFavorito(cliente: listaClientes[0])
        self.atualizarDados()
        
    }
    
}
