//
//  CustomButtonView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class CustomButtonView: UIView {
    
    public var iconButtonLabel: String = ""
    public var nameButtonLabel: String = ""
    public var buttonSize: CGSize = CGSize(width: 55, height: 55)
    public var buttonLabelFont: UIFont = .systemFont(ofSize: 14)
    public var buttonBackgroundColor: UIColor = .systemGray5
    public var buttonTintColor: UIColor = .white
    public var labelTextColor: UIColor = .white
    public var labelBackgroundColor: UIColor = .clear
    
    public lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: iconButtonLabel), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = buttonTintColor
        button.backgroundColor = buttonBackgroundColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    public lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = nameButtonLabel
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = buttonLabelFont
        label.textColor = labelTextColor
        label.backgroundColor = labelBackgroundColor
        return label
    }()
    
    public lazy var containerVStack: VStackView = {
        let view = VStackView(alignment: .center,
                              spacing: 6,
                              subviews: [
                                actionButton,
                                buttonLabel
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(iconButton: String, nameButtonLabel: String) {
        super.init(frame: .zero)
        
        self.iconButtonLabel = iconButton
        self.nameButtonLabel = nameButtonLabel
        
        initViewCode()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomButtonView: ViewCode {
    
    public func configureSubviews() {
        addSubview(containerVStack)
    }
    
    public func configureConstraints() {
        containerVStack.pin(to: self, constant: 0)
        
        NSLayoutConstraint.activate([
            actionButton.widthAnchor.constraint(equalToConstant: buttonSize.width),
            actionButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
        ])
    }
    
    public func configureAdditionalBehaviors() { }
    
}
