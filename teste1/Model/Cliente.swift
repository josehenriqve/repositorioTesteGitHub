

import Foundation

class Cliente {
    
    private let nome: String
    private let idade: Int
    private let id: String
    private var favorito: Bool
    
    init(nome: String, idade: Int, id: String, favorito: Bool) {
        self.nome = nome
        self.idade = idade
        self.id = id
        self.favorito = favorito
    }
    
    func setFavorito(favorito: Bool) {
        self.favorito = favorito
    }
    func getNome() -> String{
        return self.nome
    }
    func getFavorito() -> Bool{
        return self.favorito
    }
    
    func getIdade() -> Int{
        return self.idade
    }
    
    func getId() -> String {
        return self.id
    }
    
    func map() -> Dictionary<String, Any> {
        return [
            "nome": self.nome,
            "idade": self.idade,
            "favorito":self.favorito
        ]
    }
    
    func ordernar(listaClientes:[Cliente]) -> [Cliente] {
        var listaOrdenada = listaClientes
        
          listaOrdenada.sort{ (Cliente, Cliente2) in
              
              return (Cliente.getNome().lowercased() < Cliente2.getNome().lowercased())
              
          }
          
          listaOrdenada.sort{ (Cliente, Cliente2) in
            
              return (Cliente.getFavorito())
            
          }
          
          
          listaOrdenada.sort{ (Cliente, Cliente2) in

              return (Cliente.getFavorito() && Cliente.getNome().lowercased() < Cliente2.getNome().lowercased())
          
          }
        
          return listaOrdenada
        
    }
}
