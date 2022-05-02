//
//  ReportViewController.swift
//  ooang
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
    
    
    var textPrev = ""
    
    
    @IBOutlet weak var totalExpenseLabel: UILabel!
    @IBOutlet weak var totalIncomeLabel: UITextView!
    @IBOutlet weak var totalBalanceLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("test")
        
        reloadData()
        
        
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TransactionTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 10
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransactionStorage.arrayTransaction.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == .delete)
        {
            print(TransactionStorage.arrayTransaction)
            let removed = TransactionStorage.arrayTransaction.remove(at: indexPath.row)
            print(TransactionStorage.arrayTransaction)
            //tableView.reloadData()
            //            let index = arraySpending.count - indexPath.row - 1
            //            updateTotal(-arraySpending[index].nominal)
            //            arraySpending.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
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
        let date = TransactionStorage.arrayTransaction[indexPath.row].date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        
        dateFormatter.locale = Locale(identifier: "en_US")
        //print(dateFormatter.string(from: date))
        cell.dateTransaction.text = dateFormatter.string(from: date)
        //print(cell.dateTransaction.text)
        cell.noteTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].note
        cell.categoryTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].category
        cell.iconCategoryTransaction.image = UIImage (named: TransactionStorage.arrayTransaction[indexPath.row].icon)
        cell.amountTransaction.text = TransactionStorage.arrayTransaction[indexPath.row].amount
        cell.iconAmountTransaction.image = UIImage (named: TransactionStorage.arrayTransaction[indexPath.row].iconAmount)
        //print(TransactionStorage.arrayTransaction[indexPath.row].iconAmount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchHistory()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func reloadData(){
        
        var totalIncome: Int = 0
        var totalExpense: Int = 0
        var totalBalance: Int = 0
        
        for transaction in TransactionStorage.arrayTransaction {
            print("Transaction Amount: \(transaction.amount)")
            
            if transaction.type == "Expense" {
                totalExpense += Int(transaction.amount) ?? 0
                
            } else if transaction.type == "Income" {
                totalIncome += Int(transaction.amount) ?? 0
                
            }
            
        }
        
        totalBalance = totalIncome - totalExpense
        
//        print("-----")
//        print (totalIncome)
//        print (totalExpense)
//        print(totalBalance)
        totalBalanceLabel.text = "Rp. \(String(totalBalance))"
        totalExpenseLabel.text = "Rp. \(String(totalExpense))"
        totalIncomeLabel.text = "Rp. \(String(totalIncome))"
    }
    
    func fetchHistory() {
        reloadData()
        do {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //                print("Data Reloaded")
            }
        } catch {
            print("Gagal mendapatkan data")
        }
        
    }
    
}

