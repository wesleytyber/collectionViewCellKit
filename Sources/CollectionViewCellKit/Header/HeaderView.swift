//
//  HeaderView.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public protocol GenericProtocol: AnyObject {
    func tappedButton(_ button: UIButton)
}

public class HeaderView: UIView {
    
    public  weak var delegate: GenericProtocol?
    private var isShowing: Bool = true
    
    // MARK: - Properties
    
    public lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boa tarde,"
        label.textColor = UIColor(named: "gray")
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wesley Calazans"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    public lazy var infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    public lazy var chatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "text.bubble.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    public lazy var showBalanceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    public lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    public lazy var containerHStack: HStackView = {
        let view = HStackView(alignment: .leading,
                              margins: .init(top: 16, left: 16, bottom: 16, right: 16),
                              subviews: [
                                containerVStack,
                                infoButton,
                                chatButton,
                                showBalanceButton,
                                profileButton
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var containerVStack: VStackView = {
        let view = VStackView(alignment: .fill,
                              spacing: 8,
                              subviews: [
                                welcomeLabel,
                                userNameLabel,
                              ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Override
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Methods

extension HeaderView {
    
    public func delegate(delegate: GenericProtocol?) {
        self.delegate = delegate
    }
    
    public func showBalances() {
        isShowing.toggle()
        UIView.transition(with: showBalanceButton, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.isShowing
            ? self.showBalanceButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            : self.showBalanceButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }, completion: nil)
    }
    
    @objc public func tappedButton(_ button: UIButton) {
        switch button.tag {
        case 1:
            delegate?.tappedButton(button)
        case 2:
            delegate?.tappedButton(button)
        case 3:
            delegate?.tappedButton(button)
            showBalances()
        case 4:
            delegate?.tappedButton(button)
        default:
            break
        }
    }
}

// MARK: - Configure contraints

extension HeaderView {
    
    public func configure() {
        configureSubviews()
        configureConstraints()
    }
    
    public func configureSubviews() {
        addSubview(containerHStack)
    }
    
    public func configureConstraints() {
        containerHStack.pin(to: self, constant: 0)
        NSLayoutConstraint.activate([
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            
            chatButton.widthAnchor.constraint(equalToConstant: 40),
            chatButton.heightAnchor.constraint(equalToConstant: 40),
            
            showBalanceButton.widthAnchor.constraint(equalToConstant: 40),
            showBalanceButton.heightAnchor.constraint(equalToConstant: 40),
            
            profileButton.widthAnchor.constraint(equalToConstant: 40),
            profileButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
