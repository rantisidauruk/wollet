//
//  ReportViewController.swift
//  wollet
//
//  Created by Ranti Sidauruk on 28/04/22.
//

import UIKit

struct transaksi {
    var date: Date = Date()
    var category: String = ""
    var note: String = ""
    static var amount: String = ""
    var type: String = ""
    var icon: String = ""
}



class ReportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var totalIncome: Int = 0
    var totalExpense: Int = 0
    var totalBalance: Int = 0
    
//    var arraySpending: [Spending] = []
//    var total: Double = 0
    
    @IBOutlet weak var totalExpenseLabel: UILabel!
    @IBOutlet weak var totalIncomeLabel: UITextView!
    @IBOutlet weak var totalBalanceLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var textPrev = ""
//
//    var items: [transaksi] = [
//        transaksi(
//            category: "Health",
//            note: "abc",
//            amount: "10000",
//            type: "Expense",
//            icon: "iconHealth")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // textLabel.text = textPrev
        
        for transaction in TransactionStorage.arrayTransaction {
            print("Transaction Amount: \(transaction.amount)")
            if transaction.type == "Expense" {
                totalExpense += Int(transaction.amount) ?? 0
                
            } else if transaction.type == "Income" {
                totalIncome += Int(transaction.amount) ?? 0
                
            }
            
        }
        
        totalBalance = totalIncome - totalExpense
        print (totalIncome)
        print (totalExpense)
        print(totalBalance)
        
        totalBalanceLabel.text = "Rp. \(String(totalBalance))"
        totalExpenseLabel.text = "Rp. \(String(totalExpense))"
        totalIncomeLabel.text = "Rp. \(String(totalBalance))"
        
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
                tableView.register(nib, forCellReuseIdentifier: "TransactionTableViewCell")
                tableView.delegate = self
                tableView.dataSource = self
                tableView.backgroundColor = .clear
                tableView.layer.cornerRadius = 10
        //        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

                //fetchHistory()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TransactionStorage.arrayTransaction.count
        }
    
//    func updateTotal(_ change: Double)
//    {
//        total += change
//        labelTotal.text = "Total: Rp" + StaticFunction.doubleToCurrency(total)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {

//            if(editingStyle == .delete)
//            {
//                let index = arraySpending.count - indexPath.row - 1
//                updateTotal(-arraySpending[index].nominal)
//                arraySpending.remove(at: index)
//                tableView.deleteRows(at: [indexPath], with: .left)
//            }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        73
    }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell

            let selectedBg = UIView()
            selectedBg.backgroundColor = .clear
            cell.selectedBackgroundView = selectedBg

            let history = TransactionStorage.arrayTransaction[indexPath.row]
            
            
            
//            cell.myLabel.text = AppHelper.getStringDateTime(startDate: history.createDate!, endDate:  history.endDate ?? Date())

//            if items[indexPath.row].type == "Expense"{
//                cell.iconCategoryTransaction.image = UIImage (named: "redhealth")
//                //cell.iconCategoryTransaction.image = UIImage (named: "redhealth")
//            } else if items[indexPath.row].type == "Income"{
//                cell.iconCategoryTransaction.image = UIImage (named: "health")
            
            
//            }
            
//            cell.myLabel.text = AppHelper.getStringDateTime(startDate: history.createDate!, endDate:  history.endDate ?? Date())
            
//            import Foundation
//
//            // Create Date
//            let date = Date()
//
//            // Create Date Formatter
//            let dateFormatter = DateFormatter()
//
//            // Convert Date to String
//            dateFormatter.string(from: date)
            
            let date = TransactionStorage.arrayTransaction[indexPath.row].date
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            
            print(date)
//            dateFormatter.string(from: date)
            dateFormatter.locale = Locale(identifier: "en_US")
            print(dateFormatter.string(from: date))
            
            cell.dateTransaction.text = dateFormatter.string(from: date)
            print(cell.dateTransaction.text)
            
            cell.noteTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].note
            
            cell.categoryTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].category
            
            cell.iconCategoryTransaction.image = UIImage (named: TransactionStorage.arrayTransaction[indexPath.row].icon)
            
            cell.amountTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].amount
            
            cell.iconAmountTransaction.image = UIImage (named: TransactionStorage.arrayTransaction[indexPath.row].iconAmount)

            print(TransactionStorage.arrayTransaction[indexPath.row].iconAmount)

            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //AppHelper.initTempDetailData(sessionData: items[indexPath.row])
            self.performSegue(withIdentifier: "detailSegue", sender: self)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchHistory()
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
        }

        func fetchHistory() {
            do {
                //self.items = try context.fetch(SessionData.fetchRequest())
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print("Data Reloaded")
                }
            } catch {
                print("Gagal mendapatkan data")
            }


        }

}

