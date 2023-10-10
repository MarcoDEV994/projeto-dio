import UIKit

enum Tipo: String{
    case Crossover = "CrossOver"
    case Trail = "Trail"
    case Naked = "Naked"
    case Scooter = "Scooter"
}
protocol automovel {
    func acelerar()
}

class Moto: automovel {
    
    var nome: String
    var cilindrada: Double
    var cv: Double
    var peso: Double
    var tipo: Tipo
        
    init(nome: String, cilindrada: Double, cv: Double,peso: Double, tipo: Tipo) {
        self.nome = nome
        self.cilindrada = cilindrada
        self.cv = cv
        self.peso = peso
        self.tipo = tipo
    }
    func acelerar (){
        print("estou acelerando")
    }
}

struct Cliente {
    var nome: String
    var idade: Int
    var moto: Moto
    
    init(nome: String, idade: Int, moto: Moto){
        self.nome = nome
        self.idade = idade
        self.moto = moto
    }
}

var clientes: [Cliente] = []
var motos: [Moto] = []

func addMoto(moto: Moto) {
    motos.append(moto)
}

func addCliente(cliente: Cliente) {
    clientes.append(cliente)
}



let moto1 = Moto(nome: "Tiger", cilindrada: 800.0, cv: 45.8,peso:206.0, tipo: .Trail)
let moto2 = Moto(nome: "NC", cilindrada: 750.0, cv: 60.2,peso:190.5, tipo: .Crossover)
let cliente1 = Cliente(nome: "Luiz", idade: 34, moto: moto1)
let cliente2 = Cliente(nome: "Pedro", idade: 40, moto: moto2)


addMoto(moto: moto1)
addMoto(moto: moto2)
addCliente(cliente: cliente1)
addCliente(cliente: cliente2)

print("---------------------------------------")

func relacaoPesoPotencia (peso: Double, cv: Double) -> Double {
    return peso / cv
}

func imprimeMotoMaisPotente(motos:[Moto], relacaoPesoPotencia:(Double,Double) -> Double) {
    var motoMaior: Moto?
    var maior: Double = 0
    for moto in motos {
        if moto.cv > maior{
            motoMaior = moto
        }
    }
    if let motoMaior = motoMaior {
        print("A moto mais potente é \(motoMaior.nome), e sua relação peso potência é \(relacaoPesoPotencia(motoMaior.peso,motoMaior.cv))")
    }
}

print(relacaoPesoPotencia(peso: 190.5, cv: 60.2))


DispatchQueue.global().asyncAfter(deadline: .now()+2) {
    imprimeMotoMaisPotente(motos: motos) { peso,cv in relacaoPesoPotencia(peso: peso, cv: cv) }
}

