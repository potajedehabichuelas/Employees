//
//  UINotificationBanner.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit
import SwiftMessages

protocol UINotificationBanner {
    func showBanner(title: String, message: String)
}

extension UINotificationBanner where Self: UIViewController {

    func showBanner(title: String, message: String="") {

        let messageView = MessageView.viewFromNib(layout: .cardView)
        messageView.configureDropShadow()
        messageView.button?.isHidden = false
        messageView.button?.setTitle(title, for: .normal)

        messageView.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = .automatic
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)

        SwiftMessages.show(config: config, view: messageView)
    }

}
