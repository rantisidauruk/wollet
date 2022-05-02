//
//  FinanceViewController.swift
//  wollet
//
//  Created by Ranti Sidauruk on 27/04/22.
//

import UIKit

class FinanceViewController: UIViewController {
    
    
    @IBOutlet weak var totalBalanceFinance: UITextView!
    @IBAction func expenseButtonOnTapped(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        controller.textPrev = "Expense"
        controller.onDoneBlock = { result in
            self.reloadData()
        }
        present(controller, animated: true)
        
    }
    
    
    
    @IBAction func incomeButtonOnTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        controller.textPrev = "Income"
        controller.onDoneBlock = { result in
            self.reloadData()
        }
        present(controller, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reloadData()
        
    }
    
    func reloadData(){
        var totalBalance: Int = 0
        
        for transaction in TransactionStorage.arrayTransaction {
            print("Transaction Amount: \(transaction.amount)")
            print("Total Balance 1: \(totalBalance)")
            
            if transaction.type == "Expense" {
                totalBalance -= Int(transaction.amount) ?? 0
                
            } else if transaction.type == "Income" {
                totalBalance += Int(transaction.amount) ?? 0
                
            }
            
        }
        
        print("Total Balance 2: \(totalBalance)")
        
        totalBalanceFinance.text = "Rp. \(String(totalBalance))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        
    }
    
}

