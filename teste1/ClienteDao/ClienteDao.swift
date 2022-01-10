//
//  ClienteDao.swift
//  teste1
//
//  Created by Pede o Menu on 10/01/22.
//

import Foundation
import FirebaseFirestore

struct ClienteDao {
    
    init() {
        firebase = Firestore.firestore()
    }
    
    var firebase: Firestore?
   
    func cadastrar(cliente: Cliente) {
        
        firebase!.collection("clientes").addDocument(data:cliente.map()) { (error) in
            if error != nil {
                print("Erro ao cadastrar o usuário")
                
            } else {
                print("O usuario foi cadastrado com sucesso")
                
            }
        }
        
    }
    
    func editarCliente (cliente: Cliente) {
        
        firebase!.collection("clientes").document(cliente.getId()).setData(cliente.map()) { (error) in
            if error != nil {
                
                print("Erro ao editar o usuario")
                
                } else {
                    
                    print("Sucesso ao editar o usuario")
                }
        }
     }
    
    func remover(id: String) {
        firebase!.collection("clientes").document(id).delete()
    }

    
    func pegarClientes(completion: @escaping (Array<Cliente>) -> Void) {
        var listaClientes: [Cliente] = []
        firebase!.collection("clientes").getDocuments { snapshotResultado, erro in
            if let snapshot = snapshotResultado {
                
                for document in snapshot.documents {
                    let dadosContato = document.data()
                    let cliente = Cliente(nome: dadosContato["nome"] as! String, idade: dadosContato["idade"] as! Int, id:document.documentID,favorito: dadosContato["favorito"] as! Bool )
                     listaClientes.append(cliente)
                     completion(listaClientes)
                }
            }
        }
     }
    func salvarFavorito(cliente: Cliente) {
        
        if (cliente.getFavorito()) {
            cliente.setFavorito(favorito: false)
        } else {
            cliente.setFavorito(favorito: true)
        }
        
        firebase?.collection("clientes").document(cliente.getId()).setData(cliente.map()) { (error) in
            
            if error != nil {
                
            } else {
                
            }
        }
    }
}
