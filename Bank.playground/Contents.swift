import Foundation

enum OperationTypes: String {
    case addMoney
    case takeMoney
}

final class BankAccount {
    
    let number: String
    private var balance: Double
    
    init(number: String, balance: Double) {
        self.number = number
        self.balance = balance
    }
    
    func addMoney(addMoney: Double) {
        balance += addMoney
    }
    
    func takeMoney(takeMoney: Double) {
        if takeMoney >= balance {
        } else {
            balance -= takeMoney
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}

final class Bank {
    
    private var accounts: Set<BankAccount> = .init()
    private var transactions: [BankAccount: Set<TransferOperationInfo>] = .init()
    
    func addNewBankAccount(_ account: BankAccount) {
        accounts.insert(account)
    }
    
    func getAccountTransaction(accountNumber: String) -> Set<TransferOperationInfo>? {
        let account = accounts.first { BankAccount in
            BankAccount.number == accountNumber
        }
        if account == nil {
            return nil
        } else {
            return transactions[account!]
        }
    }
    
    func transferMoney(from number1: String, to number2: String, amount: Double) {
        let fromAccount = accounts.first { BankAccount in
            BankAccount.number == number1
        }
        let fromAccountBalanceBefore = fromAccount?.getBalance()
        let toAccount = accounts.first { BankAccount in
            BankAccount.number == number2
        }
        let toAccountBalanceBefore = toAccount?.getBalance()
        
        if fromAccount != nil && toAccount != nil {
            toAccount!.addMoney(addMoney: amount)
            fromAccount!.takeMoney(takeMoney: amount)
            
            transactions[fromAccount!, default: Set()].insert(TransferOperationInfo(accountNumber: fromAccount!.number, accountBalanceBefore: fromAccountBalanceBefore!, accountBalanceAfter: fromAccount!.getBalance(), relatedAccounrNumber: toAccount!.number, operationType: OperationTypes.takeMoney))
            
            transactions[toAccount!, default: Set()].insert(TransferOperationInfo(accountNumber: toAccount!.number, accountBalanceBefore: toAccountBalanceBefore!, accountBalanceAfter: toAccount!.getBalance(), relatedAccounrNumber: fromAccount!.number, operationType: OperationTypes.addMoney))
        }
    }
}

struct TransferOperationInfo {
    var accountNumber: String
    var accountBalanceBefore: Double
    var accountBalanceAfter: Double
    var relatedAccounrNumber: String?
    var date = Date()
    var operationType: OperationTypes
}

extension BankAccount: Hashable {
    static func == (lhs: BankAccount, rhs: BankAccount) -> Bool {
        lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
        hasher.combine(balance)
    }
}

extension TransferOperationInfo: Hashable {
    static func == (lhs: TransferOperationInfo, rhs: TransferOperationInfo) -> Bool {
        lhs.accountNumber == rhs.accountNumber
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountNumber)
    }
}

let bank = Bank()

let account1 = BankAccount(number: "1234", balance: 12000.0)
let account2 = BankAccount(number: "5678", balance: 5000.0)

bank.addNewBankAccount(account1)
bank.addNewBankAccount(account2)

account1.addMoney(addMoney: 300.0)
account2.takeMoney(takeMoney: 2700)

bank.transferMoney(from: "1234", to: "5678", amount: 3500.0)
let transactions = bank.getAccountTransaction(accountNumber: "1234")?.union(bank.getAccountTransaction(accountNumber: "5678")!)
transactions?.forEach({ account in
    print("Счет банковского аккаунта \(account.accountNumber) до операции составляет: \(account.accountBalanceBefore)")
    print("Счет банковского аккаунта \(account.accountNumber) после операции составляет: \(account.accountBalanceAfter)")
})
