//
//  ArrayViewModel.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

// Protocol that represents a ViewModel that provides data of an a array of a determined type
protocol ArrayViewModel: class {
    associatedtype ViewModel
    var viewModel: [ViewModel] { get set }

    func count() -> Int
}

extension ArrayViewModel {
    func count() -> Int {
        return self.viewModel.count
    }

    func itemAtIndex(_ index: Int) -> ViewModel {
        return self.viewModel[index]
    }
}
