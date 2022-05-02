//
//  TransactionTableViewCell.swift
//  wollet
//
//  Created by Ranti Sidauruk on 28/04/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconAmountTransaction: UIImageView!
    @IBOutlet weak var amountTransaction: UILabel!
    @IBOutlet weak var categoryTransaction: UILabel!
    @IBOutlet weak var noteTransaction: UILabel!
    @IBOutlet weak var dateTransaction: UILabel!
    @IBOutlet weak var iconCategoryTransaction: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
