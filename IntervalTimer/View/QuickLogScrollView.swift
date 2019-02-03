//
//  QuickLogScrollView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/30/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class QuickLogScrollView: UIScrollView {
    
    var dataEntryViews: [DataEntryUIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    
    lazy var dataEntryView: DataEntryUIView = {
        let view = DataEntryUIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 118.0))
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var addIntervalButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 30.0)
        button.setImage(UIImage(named: "circle_add.png"), for: .normal)
        button.setTitle("Add Interval", for: .normal)
        button.addTarget(self, action: #selector(addIntervalButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func addIntervalButtonPressed() {
        addDataEntryView()
    }
    
    func addDataEntryView() {
        stackView.addArrangedSubview(dataEntryView)
    }

    func setupView() {
        backgroundColor = UIColor.green
        addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 118.0).isActive = true
        
        addDataEntryView()
        
        addSubview(addIntervalButton)
        addIntervalButton.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: 16.0).isActive = true
        addIntervalButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        addIntervalButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 16.0).isActive = true
    }
    
    

}
