//
//  UITextView.swift
//  Localization
//
//  Created by Narek Simonyan on 3/18/19.
//  Copyright © 2019 Narek Simonyan. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UITextView {
    
    private var localizedKey: String? {
        get {
            return getAssociatedValue(key: "localizedKey", object: self, initialValue: nil)
        }
        set {
            set(associatedValue: newValue, key: "localizedKey", object: self)
        }
    }
    
    @IBInspectable var localizedText: String? {
        
        get { return text }
        set {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            localizedKey = newValue
            text = newValue?.localized()
        }
    }
    
    @objc private func languageChanged() {
        text = localizedKey?.localized()
    }
}
