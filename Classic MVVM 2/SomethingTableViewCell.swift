//
//  SomethingTableViewCell.swift
//  Classic MVVM 2
//
//  Created by EquipeSuporteAplicacao on 8/6/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class SomethingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTtitle: UILabel!
    

    func setup(something : Something){
        self.lblTtitle.text = something.title
    }
}
