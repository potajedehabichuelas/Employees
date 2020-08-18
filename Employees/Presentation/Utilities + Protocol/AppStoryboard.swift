//
//  AppStoryboard.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit

/*
 * This extension must declare a enum case for each of the storyboards used within the app
 * This extension helps 'StoryboardIdentifiable' protocol as it avoids hardcoding the storyboard name too.
 */

extension UIStoryboard {
    enum Storyboard: String {
        case main


        var filename: String {
            return rawValue.capitalized
        }
    }

    // MARK: - Convenience Initializers
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    // MARK: - Class Functions
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
}
