//
//  Model.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 27.06.23.
//

import Foundation
import UIKit

struct Person {
    let profileIcon: UIImage
    let name: String
    let surname: String
    var fullname: String {
        name + surname
    }
    let subject: String
    let message: String
    let date: String
    let favorite: Bool
}
