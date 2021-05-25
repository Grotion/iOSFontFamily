//
//  AllFontFamily.swift
//  iOSFontFamily
//
//  Created by Shaun Ku on 2021/4/4.
//

import Foundation
import UIKit

extension UIFont {
    static func printAll() {
        familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            fontNames(forFamilyName: familyName).sorted().forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
    }
    
    static func returnAll() -> [String]{
        var names = [String]()
        names.removeAll()
        familyNames.sorted().forEach { familyName in
            fontNames(forFamilyName: familyName).sorted().forEach { fontName in
                names.append(fontName)
            }
        }
        return names
    }
}
