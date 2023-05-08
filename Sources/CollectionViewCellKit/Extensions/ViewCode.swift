//
//  ViewCode.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit

public protocol ViewCode: AnyObject {
    func initViewCode()
    func configureSubviews()
    func configureConstraints()
    func configureAdditionalBehaviors()
}

public extension ViewCode {
    func initViewCode() {
        configureSubviews()
        configureConstraints()
        configureAdditionalBehaviors()
    }
}
