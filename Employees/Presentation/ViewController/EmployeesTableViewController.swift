//
//  EmployeesTableViewController.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit

class EmployeesTableViewController: UITableViewController, ViewModelBased {

    typealias ViewModel = EmployeesModelControllerProtocol
    var viewModel: EmployeesModelControllerProtocol!

    var selectedIndex: Int = -1

    private struct UIMessages {
        static let genericError = "ERROR LOADING EMPLOYEES"
        static let noEmployess = "THERE ARE NO EMPLOYEES"
    }

    private struct Segues {
        static let detailsSegue = "employeeDetailsSegue"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        //Load HUD
        self.showHUD()
        self.viewModel.getEmployees(completion: { success in
            self.hideHUD()
            if success {
                if self.viewModel.count() > 0 {
                    self.tableView.reloadData()
                } else {
                    self.showBanner(title: UIMessages.noEmployess)
                }
            } else {
                //Show UI message depending on the error type
                self.showBanner(title: UIMessages.genericError)
            }
        })
    }
}

extension EmployeesTableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EmployeeTableViewCell.self), for: indexPath) as? EmployeeTableViewCell
            else { return UITableViewCell() }

        let employee = self.viewModel.employeeAt(index: indexPath.row)
        cell.setup(name: employee.fullName, thumbnail: employee.photoURLSmall, team: employee.team)
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count()
    }
}

extension EmployeesTableViewController {

    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: Segues.detailsSegue, sender: self)
    }
}

extension EmployeesTableViewController {

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.detailsSegue, let detailsVc = segue.destination as? EmployeeDetailsViewController {
            guard self.selectedIndex >= 0 else { return }
            detailsVc.employee = self.viewModel.employeeAt(index: self.selectedIndex)
        }
    }
}
