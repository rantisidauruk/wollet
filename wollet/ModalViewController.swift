//
//  ModalViewController.swift
//  wollet
//
//  Created by Ranti Sidauruk on 27/04/22.
//


import UIKit


class TransactionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var categoryInput: UITextField!
    @IBOutlet weak var noteInput: UITextField!
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var icon: String!
    var iconAmount: String!
    var textPrev = ""
    var transaction = TransactionClass()
    
    var onDoneBlock : ((Bool) -> Void)?
    
    @IBAction func cancelOnTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addTransactionOnTapped(_ sender: Any) {
        
        transaction.date = dateInput.date
        transaction.category = categoryInput.text!
        transaction.note = noteInput.text!
        transaction.amount = amountInput.text!
        if textPrev == "Expense"{
            transaction.type = "Expense"
        }else {
            transaction.type = "Income"
        }
        
        switch transaction.category {
        case "Food": icon = "iconFood"
        case "Transport": icon = "iconTransport"
        case "Health": icon = "iconHealth"
        case "House": icon = "iconHouse"
        case "Pets": icon = "iconPets"
        case "Clothes": icon = "iconClothes"
        case "Bills": icon = "iconBills"
        case "Deposits": icon = "iconDeposits"
        case "Salary": icon = "iconSalary"
        case "Savings": icon = "iconSavings"
        default:
            icon = ""
        }
        
        transaction.icon = icon
        
        switch textPrev {
        case "Expense": iconAmount = "iconExpense"
        case "Income": iconAmount = "iconIncome"
        default:
            iconAmount = ""
        }
        
        transaction.iconAmount = iconAmount
        
        TransactionStorage.arrayTransaction.append(transaction)
        
        print("TRX LIST")
        for trx in TransactionStorage.arrayTransaction {
            print(trx.date)
            print(trx.category)
            print(trx.note)
            print(trx.amount)
            print(trx.type)
        }
        
        onDoneBlock!(true)
        
        self.dismiss(animated: true)
        
        
        
        let amountString = amountInput.text!
        
        
    }
    
    
    
    let expenseCategories = ["-- Choose Category --", "Food", "Transport", "Health", "House", "Pets", "Clothes", "Bills"]
    let incomeCategories = ["-- Choose Category --", "Deposits", "Salary", "Savings"]
    
    let pickerView = UIPickerView()
    
    
    var choosenCategories = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        categoryInput.textColor = UIColor.black
        noteInput.textColor = UIColor.black
        amountInput.textColor = UIColor.black
        
        self.navigationItem.title = textPrev
        
        print(textPrev)
        
        if textPrev == "Income" {
            choosenCategories = incomeCategories
        } else {
            choosenCategories = expenseCategories
        }
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        categoryInput.inputView = pickerView
        categoryInput.textAlignment = .left
        
        
        self.title = "textPrev"
        navigationBar.topItem?.title = textPrev
        
    }
}



extension TransactionViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choosenCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choosenCategories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryInput.text = choosenCategories[row]
        categoryInput.resignFirstResponder()
    }
}


