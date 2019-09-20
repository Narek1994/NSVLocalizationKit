//
//  UISegmentedControl.swift
//  Localization
//
//  Created by Narek Simonyan on 9/20/19.
//  Copyright © 2019 Narek Simonyan. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UISegmentedControl {
    
    private var localizedKeys: String? {
        get {
            return getAssociatedValue(key: "localizedKey", object: self, initialValue: nil)
        }
        set {
            set(associatedValue: newValue, key: "localizedKey", object: self)
        }
    }
    
    @IBInspectable var localizedTitles: String? {
        
        get {
            return localizedKeys
        }
        set {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
            localizedKeys = newValue
            for (index,title) in (newValue?.split(separator: ",") ?? []).enumerated() {
                setTitle(String(title).localized(), forSegmentAt: index)
            }
        }
        
    }
    
    @objc private func languageChanged() {
        for (index,title) in (localizedKeys?.split(separator: ",") ?? []).enumerated() {
            setTitle(String(title).localized(), forSegmentAt: index)
        }
    }
}
