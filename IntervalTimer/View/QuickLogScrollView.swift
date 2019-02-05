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

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: self.frame.size.width,
                            height: intrinsicContentSize.height)
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.restorationIdentifier = "stackView"

        return view
    }()

    lazy var addIntervalButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.lightGray
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30.0)
        button.setImage(UIImage(named: "circle_add.png"), for: .normal)
        button.setTitle("Add Interval", for: .normal)
        button.addTarget(self, action: #selector(addIntervalButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.restorationIdentifier = "addIntervalButton"

        return button
    }()
    
    // Mark: View Setup
    
    func setupView() {
        backgroundColor = UIColor.green
        addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        
        addNewDataEntryViewToDataEntryViewsArray()
        
        addSubview(addIntervalButton)
        addIntervalButton.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: 16.0).isActive = true
        addIntervalButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        addIntervalButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        addIntervalButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    // Mark: Adding an interval

    @objc func addIntervalButtonPressed() {
        addNewDataEntryViewToDataEntryViewsArray()
    }
    
    func addNewDataEntryViewToDataEntryViewsArray() {
        let dataEntryView: DataEntryUIView = {
            let view = DataEntryUIView()
            view.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 118.0)
            view.backgroundColor = UIColor.blue
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        
        dataEntryViews.append(dataEntryView)
        updateStackViewWithNewDataEntryView(with: dataEntryView)
        print("Views in scrollView: \(self.subviews.count)")
        print("Views in stackView: \(stackView.subviews.count)")
        print("Items in dataEntryViews: \(dataEntryViews.count)")
    }
    
    func updateStackViewWithNewDataEntryView(with dataEntryView: DataEntryUIView) {
//        stackView.addArrangedSubview(dataEntryView)
//
        let index = 0
        dataEntryViews.forEach { view in
            switch index {
            case dataEntryViews.startIndex:
                stackView.addArrangedSubview(dataEntryView)
                dataEntryView.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor).isActive = true
                dataEntryView.bottomAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor).isActive = true
                dataEntryView.leftAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leftAnchor).isActive = true
                dataEntryView.rightAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.rightAnchor).isActive = true
                dataEntryView.heightAnchor.constraint(equalToConstant: 118.0).isActive = true
            case 1..<dataEntryViews.endIndex:
                stackView.addArrangedSubview(dataEntryView)
//                dataEntryView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//                dataEntryView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
                dataEntryView.leftAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leftAnchor).isActive = true
                dataEntryView.rightAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.rightAnchor).isActive = true
                dataEntryView.heightAnchor.constraint(equalToConstant: 118.0).isActive = true
            case dataEntryViews.endIndex:
                stackView.addArrangedSubview(dataEntryView)
//                dataEntryView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
                dataEntryView.bottomAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor).isActive = true
                dataEntryView.leftAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leftAnchor).isActive = true
                dataEntryView.rightAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.rightAnchor).isActive = true
                dataEntryView.heightAnchor.constraint(equalToConstant: 118.0).isActive = true
            default:
                break
            }
        }
        
//        let stackViewWidth = calculateStackViewWidth(view: stackView)
//        let stackViewHeight = calculateStackViewHeight(view: stackView)
//        stackView.frame.size.width = intrinsicContentSize.width
//        stackView.frame.size.height = stackViewHeight
//        self.contentSize = CGSize(width: self.stackView.intrinsicContentSize.width,
//                                  height: stackViewHeight)
        
        stackView.layoutIfNeeded()
        stackView.sizeToFit()
        print("ScrollView frame: \(self.frame.size)")
        print("ScrollView size: \(contentSize)")
        print("StackView frame: \(stackView.frame.size)")
    }
    
//    func calculateScrollViewContentSize(view dataEntryView: DataEntryUIView, dataEntryViews count: Int) -> CGFloat {
//        let dataEntryViewHeight = dataEntryView.frame.size.height
//        let addButtonHeight = addIntervalButton.frame.size.height
//        let spaceBetweenViews = stackView.spacing
//
//        let contentHeight = (dataEntryViewHeight * CGFloat(count)) + addButtonHeight + spaceBetweenViews
//
//        return contentHeight
//    }

    
    
    func calculateStackViewHeight(view stackView: UIStackView) -> CGFloat {
        var calculatedHeight: CGFloat = 0
        stackView.subviews.forEach { view in
            calculatedHeight += view.frame.size.height
        }
        
        calculatedHeight += stackView.spacing
        
        return calculatedHeight
    }
    
//    func calculateStackViewWidth(view stackView: UIStackView) -> CGFloat {
//        let calculatedWidth: CGFloat = stackView.subviews[0].frame.size.width
//
//        return calculatedWidth
//    }
    
    

}
