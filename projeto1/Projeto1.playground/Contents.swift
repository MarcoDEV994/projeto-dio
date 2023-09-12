import UIKit

let nome = "Steve"
var nome2: String? = "peidei"

print("\(nome) e \(nome2 ?? "Wozniak")")

//______________

if let nome2 = nome2 {
    print("\(nome) e \(nome2)")
}

