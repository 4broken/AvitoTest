//
//  Model.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import Foundation
struct Information: Decodable {
    let company: Company
}


extension Information {
    
    // MARK: - Company
    struct Company: Decodable {
        let name: String
        let employees: [Employee]
    }

    // MARK: - Employee
    struct Employee: Decodable {
        let name, phoneNumber: String
        let skills: [String]

        enum CodingKeys: String, CodingKey {
            case name
            case phoneNumber = "phone_number"
            case skills
        }
    }
}
