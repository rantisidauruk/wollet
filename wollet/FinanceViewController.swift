//
//  FinanceViewController.swift
//  wollet
//
//  Created by Ranti Sidauruk on 27/04/22.
//

import UIKit

class FinanceViewController: UIViewController {
    var titleVc: String = ""
   
    
    @IBOutlet weak var totalBalanceFinance: UITextView!
    @IBAction func expenseButtonOnTapped(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        controller.textPrev = "Expense"
        controller.onDoneBlock = { result in
            // Do something
            self.reloadData()
        }
        present(controller, animated: true)
        
    }
    
    
    
    @IBAction func incomeButtonOnTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        controller.textPrev = "Income"
        controller.onDoneBlock = { result in
            // Do something
            self.reloadData()
        }
        present(controller, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print ("print test")
        
    }
    
    func reloadData(){
        var totalBalance: Int = 0
        
        for transaction in TransactionStorage.arrayTransaction {
            print("Transaction Amount: \(transaction.amount)")
            print(totalBalance)
            
            if transaction.type == "Expense" {
                totalBalance -= Int(transaction.amount) ?? 0
                
            } else if transaction.type == "Income" {
                totalBalance += Int(transaction.amount) ?? 0
                
            }
            
        }
        
        totalBalanceFinance.text = "Rp. \(String(totalBalance))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        
    }
    
}

