//
//  File.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class C6InvestView: UIView {
    
    public lazy var C6investLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = createAttributedString(from: "Já conhece nossa plataforma de\ninvestimentos?\n\nDe renda fixa a variável, você encontra\nopções para todos os perfis.")
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var investButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Investir", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        return button
    }()
    
    public lazy var cardView: ReusableCardView = {
        let view = ReusableCardView(
            topView:
                VStackView(subviews: [C6investLabel]),
            bottomView:
                HStackView(subviews: [investButton]))
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

extension C6InvestView {
    
    public func createAttributedString(from string: String) -> NSAttributedString {
        let attributedComplete: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ]
        
        let attributedValue: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor(named: "label-gray-color") ?? UIColor()
        ]
        
        let attributeFormat = NSMutableAttributedString(
            string: string,
            attributes: attributedComplete
        )
        
        attributeFormat.addAttributes(attributedValue, range: NSRange(location: 45, length: 70))
        
        return attributeFormat
    }
    
}

// MARK: - Configure constraints

extension C6InvestView: ViewCode {
    
    public func configureSubviews() {
        addSubview(cardView)
    }
    
    public func configureConstraints() {
        cardView.pinWhitoutBottom(to: self, constant: 0)
        
        NSLayoutConstraint.activate([
            investButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    public func configureAdditionalBehaviors() { }
    
}
