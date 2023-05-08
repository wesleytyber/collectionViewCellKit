//
//  BalanceCell.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class BalanceCell: UICollectionViewCell {
    
    public static let identifier = "BalanceCell"
    
    // MARK: - Properties
    
    public lazy var countryImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "flag")
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
      
        return view
    }()
    
    public lazy var balanceTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(named: "gray")
        view.text = "Saldo em Conta Corrente"
        return view
    }()
    
    public lazy var currencyBalanceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 14)
        view.textColor = UIColor(named: "gray")
        view.text = "R$  "
        return view
    }()
    
    public lazy var balanceTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.font = .systemFont(ofSize: 22, weight: .medium)
        view.isSecureTextEntry = true
        view.isUserInteractionEnabled = false
        view.text = "5.503.132,63"
        return view
    }()
    
    public lazy var extractButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Exibir extrato", for: .normal)
        button.setTitleColor(UIColor(named: "label-gray-color"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    public lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        view.contentMode = .scaleAspectFit
        view.tintColor = UIColor(named: "label-gray-color")
        return view
    }()
    
    public lazy var containerHStack: HStackView = {
        let view = HStackView(alignment: .center,
                              spacing: 6,
                              subviews: [
                                countryImageView,
                                balanceTitleLabel,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var balanceHStack: HStackView = {
        let view = HStackView(alignment: .trailing,
                              spacing: -6,
                              subviews: [
                                currencyBalanceLabel,
                                balanceTextField,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var containerVStack: VStackView = {
        let view = VStackView(spacing: 6,
                              subviews: [
                                containerHStack,
                                balanceHStack,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var cardView: ReusableCardView = {
        let view = ReusableCardView(
            topView: VStackView(subviews: [containerVStack]),
            bottomView: HStackView(alignment: .fill,
                                   distribution: .equalSpacing,
                                   margins: .init(top: 0, left: 16, bottom: 0, right: 16),
                                   subviews: [
                                    extractButton,
                                    rightImageView
                                   ])
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializes
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        updateTextField()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension BalanceCell {
 
    public func updateTextField() {
        NotificationCenter.default.addObserver(forName: .updateBooleanState, object: nil, queue: nil) { notification in
            self.balanceTextField.isSecureTextEntry.toggle()
        }
    }
    
    public func configureCell(data: UserInfos) {
        countryImageView.image = UIImage(named: data.flag)
        balanceTitleLabel.text = data.accountType
        
        currencyBalanceLabel.text = data.currencyBalanceLabel
        balanceTextField.text = data.balance
        
        extractButton.setTitle(data.actionLabel, for: .normal)
        extractButton.setTitleColor(UIColor(named: data.actionLabelColor), for: .normal)
        
        rightImageView.tintColor = UIColor(named: data.actionLabelColor)
        cardView.bottomView.backgroundColor = UIColor(named: data.actionBackground)
    }
    
}

// MARK: - Configure constraints

extension BalanceCell {
    
    func configure() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        addSubview(cardView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            countryImageView.widthAnchor.constraint(equalToConstant: 20),
            countryImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
