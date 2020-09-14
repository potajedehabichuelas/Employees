//
//  EmployeeDetailsViewController.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 14/09/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit
import Kingfisher

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet private var employeeImage: UIImageView!
    @IBOutlet private var fullName: UILabel!
    @IBOutlet private var email: UILabel!
    @IBOutlet private var team: UILabel!
    @IBOutlet private var bio: UITextView!
    @IBOutlet private var phoneNumber: UILabel!
    @IBOutlet private var employeeType: UILabel!

    var employee: EmployeeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let emp = self.employee else {
            self.showBanner(title: "There is no employee")
            return
        }

        self.fullName.text = emp.fullName
        self.email.text = emp.emailAddress
        self.bio.text = emp.biography
        self.phoneNumber.text = emp.phoneNumber
        self.team.text = emp.team
        self.employeeType.text = emp.employeeType.UIString()

        if let img = emp.photoURLLarge, let imgUrl = URL(string: img) {
            self.employeeImage?.kf.indicatorType = .activity
            self.employeeImage?.kf.setImage(with: imgUrl)
        } else {
            // Show img error
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
