//
//  UITabBarItem.swift
//  Localization
//
//  Created by Narek Simonyan on 9/25/18.
//  Copyright © 2018 Narek Simonyan. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UITabBarItem {
    
    private var localizedKey: String? {
        get {
            return getAssociatedValue(key: "localizedKey", object: self, initialValue: nil)
        }
        set {
            set(associatedValue: newValue, key: "localizedKey", object: self)
        }
    }
    
    @IBInspectable var localizedTitle: String? {
        
        get { return title }
        set {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            localizedKey = newValue
            title = newValue?.localized()
        }
    }
    
    @objc private func languageChanged() {
        title = localizedKey?.localized()
    }
}

