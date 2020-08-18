//
//  StoryboardIdentifiable.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit

/*
 * This protocol provides with the StoryboardIdentifier of the conforming ViewController to avoid hardcoding
 * its String value. It also includes a UIStoryboard extension to simplify UIViewController instantiation
 */

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Error: Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}
