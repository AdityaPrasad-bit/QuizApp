//
//  TableViewCell.swift
//  QuizApp
//
//  Created by Aditya on 12/08/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfUser: UILabel!
    
    @IBOutlet weak var totalQue: UILabel!
    
    @IBOutlet weak var totalScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
