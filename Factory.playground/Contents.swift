import Foundation

final class Person {
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("\(fullName) инициализировался")
    }
    
    deinit {
        print("\(fullName) деинициализировался")
    }
}

final class Passport {
    var series: Int
    var number: Int
    var dateOfIssue: Date
    weak var owner: Person?
    
    init(series: Int, number: Int, dateOfIssue: Date, owner: Person) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.owner = owner
        print("Паспорт серии: \(series) и номера: \(number) инициализировался")
    }
    
    deinit {
        print("Паспорт серии: \(series) и номера: \(number) деинициализировался")
    }
}

final class ConstractionMaterials {
    var name: String
    var quantity: Int
    var price: Double
    
    init(name: String, quantity: Int, price: Double) {
        self.name = name
        self.quantity = quantity
        self.price = price
        print("Материал \(name) инициализировался")
    }
    
    deinit {
        print("Материал \(name) деинициализировался")
    }
}

final class Product {
    var productName: String
    var materials: [ConstractionMaterials]
    
    init(productName: String, materials: [ConstractionMaterials]) {
        self.productName = productName
        self.materials = materials
        print("Продукт \(productName) инициализировался")
    }
    
    deinit {
        print("Продукт \(productName) деинициализировался")
    }
}

final class Factory {
    var name: String
    var customers: [Person]
    var products: [Product]
    
    init(name: String, customers: [Person] = [], products: [Product] = []) {
        self.name = name
        self.customers = customers
        self.products = products
        print("Фабрика \(name) инициализировалась")
    }
    
    deinit {
        print("Фабрика \(name) деинициализировалась")
    }
    
    func addNewCustomer(newCustomer: Person) {
        customers.append(newCustomer)
        print("Новый сотрудник \(newCustomer) присоединился к \(name)")
    }
    
    func produceNewProduct(productName: String, materials: [ConstractionMaterials]) -> Product? {
        let newProduct = Product(productName: productName, materials: materials)
        products.append(newProduct)
        print("\(name) изготовил \(newProduct.productName)")
        return newProduct
    }
}

func testFactoryMemory() {
    
    var factory: Factory? = Factory(name: "Строительство мебели")
    
    //Работник №1
    var person1: Person? = Person(fullName: "Иванов Иван Иванович", age: 32)
    var passport1: Passport? = Passport(series: 1220, number: 908674, dateOfIssue: Date(), owner: person1!)
    person1?.passport = passport1
    
    //Работник №2
    var person2: Person? = Person(fullName: "Семенова Наталья Викторовна", age: 44)
    var passport2: Passport? = Passport(series: 3356, number: 234859, dateOfIssue: Date(), owner: person2!)
    person2?.passport = passport2
    
    factory?.addNewCustomer(newCustomer: person1!)
    factory?.addNewCustomer(newCustomer: person2!)
    
    //Создаем материалы
    var material1 = ConstractionMaterials(name: "Дерево", quantity: 10, price: 1_500)
    var material2 = ConstractionMaterials(name: "Железо", quantity: 8, price: 2_700)
    
    //Создаем продукты
    var product1: Product? = factory?.produceNewProduct(productName: "Шкаф", materials: [material1])
    var product2: Product? = factory?.produceNewProduct(productName: "Стул", materials: [material1, material2])
    var product3: Product? = factory?.produceNewProduct(productName: "Замок для двери", materials: [material2])
    
    //Person и product освободятся после factory, так как между ними сильная связь
    person1 = nil
    person2 = nil
    product1 = nil
    product2 = nil
    product3 = nil
    passport1 = nil
    passport2 = nil
    factory = nil
    
    sleep(5)
}

testFactoryMemory()
