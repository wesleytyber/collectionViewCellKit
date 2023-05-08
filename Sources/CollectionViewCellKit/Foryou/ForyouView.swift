//
//  File.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit
import StackView

public class ForyouView: UIView {
    
    var collapsable: Bool = true
    
    public lazy var cardImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "d1")
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
        updateImage()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ForyouView {
    public func updateImage() {
        NotificationCenter.default.addObserver(forName: .updateBooleanImage, object: nil, queue: nil) { notification in
            
            self.collapsable.toggle()
            
            if self.collapsable {
                UIView.animate(withDuration: 0.5) {
                    self.cardImageView.image = UIImage(named: "d1")
                    self.cardImageView.contentMode = .scaleToFill
                }
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.cardImageView.image = UIImage(named: "c1")
                    self.cardImageView.contentMode = .scaleToFill
                }
            }
        }
    }
}

extension ForyouView: ViewCode {
    
    public func configureSubviews() {
        addSubview(cardImageView)
    }
    
    public func configureConstraints() {
        cardImageView.pin(to: self, constant: 0)
    }
    
    public func configureAdditionalBehaviors() { }
    
}
