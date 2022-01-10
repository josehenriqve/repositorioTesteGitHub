//
//  ClienteDao.swift
//  teste1
//
//  Created by Pede o Menu on 10/01/22.
//

import Foundation
import Firebase

struct clienteDao {
    /*
    func cadastrar() {
       
        firebase?.collection("clientes").addDocument(data:cliente.map()) { (error) in
            if error != nil {
                self.showAlert(titulo: "Erro", mensagem: "Erro ao cadastrar o cliente")
                
            } else {
                self.showAlert(titulo: "Sucesso", mensagem: "O Cliente foi cadastrado com sucesso!")
                
            }
        }
    }
    
    func editarCliente () {
        
        firebase?.collection("clientes").document(cliente.getId()).setData(cliente.map()) { (error) in
            if error != nil {
                
                self.showAlert(titulo: "Erro", mensagem: "Erro ao editar o Cliente")
                
            } else {
                self.showAlert(titulo: "Sucesso", mensagem: "Todas as alterações do cliente foram salvas")
                
            }
        }
    }
    
    func read() {
        
        firebase.collection("clientes").getDocuments {
            snapshotResultado, erro in
            if let snapshot = snapshotResultado {
                
                for document in snapshot.documents {
                    let dadosContato = document.data()
                    let cliente = Cliente(nome: dadosContato["nome"] as! String, idade: dadosContato["idade"] as! Int, id:document.documentID,favorito: dadosContato["favorito"] as! Bool )
                    self.listaClientes.append(cliente)
                }
                
                print(self.listaClientes)
                
            }
        }
        
    }
     */
}
