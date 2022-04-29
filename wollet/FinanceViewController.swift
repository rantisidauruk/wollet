//
//  FinanceViewController.swift
//  wollet
//
//  Created by Ranti Sidauruk on 27/04/22.
//

import UIKit

class FinanceViewController: UIViewController {
    var titleVc: String = ""
//    var totalBalance: Int = 0
//    var totalIncome: Int = 0
//    var totalExpense: Int = 0
    
    @IBOutlet weak var totalBalanceOnFinance: UILabel!
    
    @IBAction func expenseButtonOnTapped(_ sender: Any) {
        //        self.titleVc = "Add Expense"
        //        performSegue(withIdentifier: "goToAddTransaction", sender: self)
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        
        //controller.modalPresentationStyle = .fullScreen
        //controller.modalTransitionStyle = .crossDissolve
        
        controller.textPrev = "Expense"
        
        present(controller, animated: true)
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if (segue.identifier == "goToAddTransaction") {
    //            let vc = segue.destination as? TransactionViewController
    //            vc?.textPrev = titleVc
    ////            vc?.delegate = self
    //        }
    //    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let VC = segue.destination as? ModalViewController
    //        VC?.title = "Add Expense"
    //    }
    
    
    @IBAction func incomeButtonOnTapped(_ sender: Any) {
        //print("test2")
        //performSegue(withIdentifier: "goToAddTransaction", sender: self)
        //        self.titleVc = "Add Income"
        let controller = storyboard?.instantiateViewController(withIdentifier: "ModalsView") as! TransactionViewController
        
        //controller.modalPresentationStyle = .fullScreen
        //controller.modalTransitionStyle = .crossDissolve
        
        controller.textPrev = "Income"
        
        present(controller, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        totalBalance = totalIncome - totalExpense
//        let testAmount = transaksi.amount
//        print (testAmount)
        
    
//       print(totalBalance)
    }
    
}

