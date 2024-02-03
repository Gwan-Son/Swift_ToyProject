//
//  DBError.swift
//  LMessenger
//
//  Created by 심관혁 on 2/2/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
}
