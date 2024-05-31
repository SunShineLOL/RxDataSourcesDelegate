//
//  DemoCellContentView.swift
//  RxDataSourcesDelegate_Example
//
//  Created by czn on 2024/5/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

class DemoCellContentView: UIView {
    lazy var title: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 18)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    lazy var content: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 16)
        view.numberOfLines = 0
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.textAlignment = .right
        return view
    }()
    
    lazy var switcView: UISwitch = {
        let view = UISwitch()
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        return view
    }()
    
    lazy var stackview: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        return view
    }()
    
    let type: DemoCellType
    
    init(type: DemoCellType) {
        self.type = type
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.makeIU()
    }
    
    required init?(coder: NSCoder) {
        self.type = .content
        super.init(coder: coder)
        self.makeIU()
    }
    
    func makeIU() {
        self.stackview.addArrangedSubview(self.title)
        switch self.type {
        case .content:
            self.stackview.addArrangedSubview(self.content)
        case .boolean:
            self.stackview.addArrangedSubview(UIStackView())
            self.stackview.addArrangedSubview(self.switcView)
        }
    }
}
