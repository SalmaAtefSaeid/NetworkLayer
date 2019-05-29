//
//  Currency.swift
//  NetworkLayer
//
//  Created by JETS Mobile Lab-12 on 5/29/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

struct Currency: Codable {
    
    let base: String
    let rates: [String: Double]
    let date: String
    
}
