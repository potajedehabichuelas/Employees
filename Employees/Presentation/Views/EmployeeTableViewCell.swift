//
//  EmployeeTableViewCell.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit
import Kingfisher

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet private var name: UILabel!
    @IBOutlet private var thumbnail: UIImageView!
    @IBOutlet private var team: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(name: String, thumbnail: String?, team: String) {
        self.name.text = name
        self.team.text = team
        //Reset img to avoid issues due to recycling
        self.imageView?.image = nil
        if let img = thumbnail, let imgUrl = URL(string: img) {
            self.thumbnail?.kf.setImage(with: imgUrl)
        }
    }
}
