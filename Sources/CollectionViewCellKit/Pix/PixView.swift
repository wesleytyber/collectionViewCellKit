//
//  File.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class PixView: UIView {
    
    public weak var delegate: GenericProtocol?
    
    private var collapsable: Bool = true
    
    public lazy var fourButtonView: FourButtonView = {
        let button = FourButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var myKeys: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Minhas Chaves", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.tintColor = .white
        return button
    }()
    
    public lazy var myPixLimit: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Meus Limites Pix", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.tintColor = .white
        return button
    }()
    
    public lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = .systemGray2
        return view
    }()
    
    public lazy var cardView: ReusableCardView = {
        let view = ReusableCardView(
            topView:
                VStackView(subviews: [fourButtonView]),
            bottomView: HStackView(alignment: .fill,
                                       distribution: .fillProportionally,
                                       subviews: [
                                        myKeys,
                                        divider,
                                        myPixLimit
                                       ])
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

// MARK: - Methods

extension PixView: ViewCode {
    
    public func configureSubviews() {
        addSubview(cardView)
    }
    
    public func configureConstraints() {
        cardView.pinWhitoutBottom(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
