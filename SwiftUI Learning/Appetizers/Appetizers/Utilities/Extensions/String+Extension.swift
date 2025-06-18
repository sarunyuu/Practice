//
//  String+Extension.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 22/5/2568 BE.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        return range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
        
        // Minimum for iOS 16
        let emailRegex = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        
        return self.wholeMatch(of: emailRegex) != nil
    }
}
