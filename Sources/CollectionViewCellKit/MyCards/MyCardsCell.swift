//
//  MyCardsCell.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit

public class MyCardsCell: UICollectionViewCell {
    
    public static let identifier = "MyCardsCell"
    
    // MARK: - Properties
    
    public lazy var cardView: MyCardsView = {
        let view = MyCardsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Override
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure constraints

extension MyCardsCell: ViewCode {
   
    public func configureSubviews() {
        contentView.addSubview(cardView)
    }
    
    public func configureConstraints() {
        cardView.pinWhitoutBottom(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}

