//
//  User.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 22/5/2568 BE.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
