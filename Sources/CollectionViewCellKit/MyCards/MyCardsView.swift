//
//  MyCardsView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView
import CollectionHeaderKit

public class MyCardsView: UIView {
    
    // MARK: - Properties
    
    public lazy var label: SectionHeader = {
        let view = SectionHeader(sectionImageLabel: "circles.hexagonpath.fill",
                                 sectionImagecontentMode: .scaleAspectFit,
                                 sectionImageWidth: 15,
                                 sectionImageHeight: 15,
                                 
                                 sectionTitleLabel: "Aberta",
                                 sectionTitleColor: .white,
                                 sectionTitleFontSize: 18,
                                 sectionTitleFontWeight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var rightLabel: SectionHeader = {
        let view = SectionHeader(sectionTitleLabel: "Vence em 20/05",
                                 sectionTitleColor: .white,
                                 sectionTitleFontSize: 18,
                                 sectionTitleFontWeight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var textField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "*******"
        field.textColor = .white
        return field
    }()
    
    public lazy var downloadButton: UIButton = {
        let field = UIButton()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.setTitle("Baixar fatura", for: .normal)
        field.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return field
    }()
    
    public lazy var accessButton: UIButton = {
        let field = UIButton()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.setTitle("Acessar fatura", for: .normal)
        field.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return field
    }()
    
    public lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray2
        view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        return view
    }()
    
    public lazy var containerHStack: HStackView = {
        let view = HStackView(alignment: .center,
                              distribution: .equalSpacing,
                              subviews: [
                                label,
                                rightLabel,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var VStack: VStackView = {
        let view = VStackView(spacing: 8,
                              margins: .init(top: 0, left: 0, bottom: 32, right: 0),
                              subviews: [
                                containerHStack,
                                textField,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    public lazy var cardView: ReusableCardView = {
        let view = ReusableCardView(
            topView:
                VStackView(alignment: .fill,
                           subviews: [
                            VStack
                           ]
                          ),
            bottomView: HStackView(alignment: .fill,
                                   distribution: .fillProportionally,
                                   subviews: [
                                     downloadButton,
                                     divider,
                                     accessButton,
                                   ]
                                  )
        )
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

extension MyCardsView: ViewCode {
    
    public func configureSubviews() {
        addSubview(cardView)
    }
    
    public func configureConstraints() {
        cardView.pinWhitoutBottom(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
