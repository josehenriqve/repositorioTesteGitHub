

import Foundation

class Cliente {
    
    private let nome: String
    private let idade: Int
    private let id: String
    private var favorito: Bool
    private var urlImagem: String
    
    init(nome: String, idade: Int, id: String, favorito: Bool, urlImagem: String) {
        
        self.nome = nome
        self.idade = idade
        self.id = id
        self.favorito = favorito
        self.urlImagem = urlImagem
    }
    
    func setFavorito(favorito: Bool) {
        self.favorito = favorito
    }
    
    func getNome() -> String{
        return self.nome
    }
    
    func getUrlImagem() -> String{
        return self.urlImagem
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
            "favorito":self.favorito,
            "urlImagem": self.urlImagem
            
        ]
        
    }
}
