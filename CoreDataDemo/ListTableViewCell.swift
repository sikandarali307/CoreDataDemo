//
//  ListTableViewCell.swift
//  CoreDataDemo
//
//  Created by Sikandar Ali on 20/05/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var lblname: UILabel!
    var student : Student!{
        didSet{
            lblname.text = student.name as? String
            lbladdress.text = student.address as? String
            lblcity.text = student.city as? String
            lblphone.text = student.phone as? String
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
