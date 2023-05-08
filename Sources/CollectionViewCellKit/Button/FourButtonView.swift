//
//  FourButtonView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class FourButtonView: UIView {
    
    public lazy var seeExtractButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "qrcode.viewfinder", nameButtonLabel: "Pagar QR\nCode")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var transferButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "arrow.left.arrow.right", nameButtonLabel: "Transferir")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var payButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "dollarsign.circle", nameButtonLabel: "Receber")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var depositButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "dollarsign.square", nameButtonLabel: "Saque e\nTroco")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var containerHStack: HStackView = {
        let view = HStackView(alignment: .fill,
                              spacing: 6,
                              distribution: .equalSpacing,
                              subviews: [
                                seeExtractButtonView,
                                transferButtonView,
                                payButtonView,
                                depositButtonView,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var containerVStack: VStackView = {
        let view = VStackView(alignment: .fill,
                              subviews: [
                                containerHStack
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FourButtonView: ViewCode {
    
    public func configureSubviews() {
        addSubview(containerVStack)
    }
    
    public func configureConstraints() {
        containerVStack.pin(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
