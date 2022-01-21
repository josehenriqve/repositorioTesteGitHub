//
//  ListaDeClientesViewController.swift
//  teste1
//
//  Created by Pede o Menu on 12/01/22.
//

import UIKit

class ListaDeClientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var listaClientes: [Cliente] = []
    var clienteDAO: ClienteDao!
    @IBOutlet weak var barra: UINavigationItem!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        clienteDAO = .init()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        
    }
    
    func atualizarDados() {
        listaClientes.removeAll()
        clienteDAO.pegarClientes { (Clientes) in
            self.listaClientes = Clientes
            self.tableView.reloadData()
            self.ordernar()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        atualizarDados()
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
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    @IBAction func clickei(_ sender: Any) {
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaClientes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    @IBAction func hello(_ sender: Any) {
       
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editarButtonCell = UIContextualAction(style: .normal, title: "Editar") {  (contextualAction, view, boolValue) in
            let listaClientesAux = self.listaClientes.remove(at: indexPath.row)
            self.listaClientes.removeAll()
            self.listaClientes.append(listaClientesAux)
            self.performSegue(withIdentifier: "SegueEditar", sender: nil)
            
        }
        
        let deletarButtonCell = UIContextualAction(style: .destructive, title: "Deletar") {  (contextualAction, view, boolValue) in
            self.clienteDAO.remover(id: self.listaClientes[indexPath.row].getId())
            self.listaClientes.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deletarButtonCell, editarButtonCell])
        return swipeActions
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueEditar" {
            
            let vcDestino = segue.destination as! CadastroviewViewController
            let clienteEnviar: Cliente = Cliente(nome: listaClientes[0].getNome(), idade: listaClientes[0].getIdade(), id: listaClientes[0].getId(),favorito: listaClientes[0].getFavorito(),urlImagem: listaClientes[0].getUrlImagem())
            vcDestino.cliente = clienteEnviar
        }
        
        if segue.identifier == "detalhes" {
            
            let vcDestino = segue.destination as! DetalhesViewController
            let clienteEnviar: Cliente = Cliente(nome: listaClientes[0].getNome(), idade: listaClientes[0].getIdade(), id: listaClientes[0].getId(),favorito: listaClientes[0].getFavorito(),urlImagem: listaClientes[0].getUrlImagem())
            vcDestino.cliente = clienteEnviar
        }
    }
    
    @IBAction func unwindToListaViewController(_ unwindSegue: UIStoryboardSegue) {
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReusoCliente", for: indexPath) as! CelulaTableViewCell
        let dadosClientes = self.listaClientes[indexPath.row]
        
        if dadosClientes.getFavorito() {
            
            celula.cellLabel.text = dadosClientes.getNome()
            celula.cellLabelIdade.text = "\(dadosClientes.getIdade()) \(verificaIadade(idade: dadosClientes.getIdade()))"
            celula.cellImage.downloaded(from: dadosClientes.getUrlImagem())
            celula.botaoFavorito.isSelected = true
            celula.cellDelegate = self
            celula.index = indexPath
            celula.cellViewDelegate = self
            celula.index2 = indexPath
            return celula
            
        } else {
            
            celula.cellLabel.text = dadosClientes.getNome()
            celula.cellLabelIdade.text = "\(dadosClientes.getIdade()) \(verificaIadade(idade: dadosClientes.getIdade()))"
            celula.cellImage.downloaded(from: dadosClientes.getUrlImagem())
            celula.botaoFavorito.isSelected = false
            celula.cellDelegate = self
            celula.index = indexPath
            celula.cellViewDelegate = self
            celula.index2 = indexPath
            return celula
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Toquei")
    }
    
    func verificaIadade(idade: Int) -> String{
        return idade == 1 ? "ano": "anos"
    }
    
}

extension ListaDeClientesViewController: botaoDelegate {
    
    func onClickButton(index: Int) {
         
        clienteDAO.salvarFavorito(cliente: listaClientes[index])
        self.atualizarDados()
    }

}
extension ListaDeClientesViewController: celulaDelegate {
    func onClickCelula(index: Int) {
        let listaClientesAux = self.listaClientes.remove(at: index)
        self.listaClientes.removeAll()
        self.listaClientes.append(listaClientesAux)
        
        self.performSegue(withIdentifier: "detalhes", sender: nil)
        self.atualizarDados()
    }
}
