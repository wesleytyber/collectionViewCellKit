//
//  SectionHeaderView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView
import CollectionHeaderKit

public class SectionHeaderView: UICollectionReusableView {
   
    public static let identifier = "SectionHeaderView"
   
    public lazy var titleCollectionLabel: SectionHeader = {
        let button = SectionHeader()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension SectionHeaderView: ViewCode {
    
    public func configureSubviews() {
        addSubview(titleCollectionLabel)
    }
    
    public func configureConstraints() {
        NSLayoutConstraint.activate([
            titleCollectionLabel.topAnchor.constraint(equalTo: topAnchor),
            titleCollectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleCollectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleCollectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configureAdditionalBehaviors() { }
    
}

