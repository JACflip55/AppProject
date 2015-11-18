
//
//  DealsTableViewCell.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class DealsTableViewCell: UITableViewCell {
    
    @IBOutlet var dealName: UILabel!
    @IBOutlet var dealPrice: UILabel!
    //@IBOutlet var rating: UILabel!
   /*
    @IBAction func dealGood(sender: AnyObject) {
        //data.getDealFromName(dealName!.text!).upvotes++
    }
    @IBAction func dealBad(sender: AnyObject) {
        //data.getDealFromName(dealName!.text!).downvotes++
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
