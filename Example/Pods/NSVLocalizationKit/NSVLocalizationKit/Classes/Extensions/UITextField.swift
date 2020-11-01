//
//  UITextField.swift
//  Localization
//
//  Created by Narek Simonyan on 9/25/18.
//  Copyright © 2018 Narek Simonyan. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UITextField {
    
    private var localizedKey: String? {
        get {
            return getAssociatedValue(key: "localizedKey", object: self, initialValue: nil)
        }
        set {
            set(associatedValue: newValue, key: "localizedKey", object: self)
        }
    }
    
    private var localizedPlaceholderKey: String? {
        
        get {
            return getAssociatedValue(key: "localizedPlaceholderKey", object: self, initialValue: nil)
        }
        set {
            set(associatedValue: newValue, key: "localizedPlaceholderKey", object: self)
        }
    }
    
    @IBInspectable var localizedPlaceholder: String? {
        
        get { return placeholder }
        set {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            localizedPlaceholderKey = newValue
            placeholder = newValue?.localized()
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
        if localizedPlaceholderKey != nil {
            placeholder = localizedPlaceholderKey?.localized()
        }
        if localizedKey != nil {
            text = localizedKey?.localized()
        }
    }
}

