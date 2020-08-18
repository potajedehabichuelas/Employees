//
//  ViewModelBased.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit

protocol ViewModelBased: class {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
}

// MARK: - ViewModelBased - Requires UIViewcontroller to conform to 'StoryboardIdentifiable'
extension ViewModelBased where Self: UIViewController {
    static func instantiate(from storyboard: UIStoryboard, viewModel: ViewModel) -> Self {
        let viewController: Self = storyboard.instantiateViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
