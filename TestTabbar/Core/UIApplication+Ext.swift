//
//  UIApplication+Ext.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import class UIKit.UIApplication
import class UIKit.UIWindow
import class UIKit.UIWindowScene

public extension UIApplication {
    func currentWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive}
            .compactMap { $0 as? UIWindowScene }
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        return window
    }
}
