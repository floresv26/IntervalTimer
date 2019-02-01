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
    
    

    func setupView() {
        backgroundColor = UIColor.green
        addSubview(dataEntryView)
        dataEntryView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        dataEntryView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        dataEntryView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        dataEntryView.heightAnchor.constraint(equalToConstant: 118.0).isActive = true
        
    }
    
    

}
