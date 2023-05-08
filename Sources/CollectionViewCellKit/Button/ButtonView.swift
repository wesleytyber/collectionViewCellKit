//
//  ButtonView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class ButtonView: UIView {
    
    public lazy var seeExtractButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "doc.plaintext.fill", nameButtonLabel: "Ver Extrato")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var payButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "barcode.viewfinder", nameButtonLabel: "Pagar")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var transferButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "arrow.left.arrow.right", nameButtonLabel: "Transferir")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var depositButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "dollarsign.circle", nameButtonLabel: "Depositar")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var allButtonView: CustomButtonView = {
        let button = CustomButtonView(iconButton: "circle", nameButtonLabel: "Todos")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var containerHStack: HStackView = {
        let view = HStackView(alignment: .fill,
                              spacing: 6,
                              distribution: .equalSpacing,
                              subviews: [
                                seeExtractButtonView,
                                payButtonView,
                                transferButtonView,
                                depositButtonView,
                                allButtonView,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var VStack: VStackView = {
        let view = VStackView(alignment: .fill,
                              spacing: 8,
                              subviews: [
                                containerHStack
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var containerVStack: VStackView = {
        let view = VStackView(alignment: .fill,
                              subviews: [
                                VStack
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

extension ButtonView: ViewCode {
    
    public func configureSubviews() {
        addSubview(containerVStack)
    }
    
    public func configureConstraints() {
        containerVStack.pin(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
