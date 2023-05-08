//
//  ButtonCell.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit

public class ButtonCell: UICollectionViewCell {
    
    public static let identifier = "ButtonCell"
    
    // MARK: - Properties
    
    public lazy var cardView: ButtonView = {
        let view = ButtonView()
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

extension ButtonCell: ViewCode {
   
    public func configureSubviews() {
        contentView.addSubview(cardView)
    }
    
    public func configureConstraints() {
        cardView.pin(to: contentView, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
