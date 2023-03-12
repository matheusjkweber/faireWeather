//
//  MainView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class CitySelectorView: UIView {
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
    }
}
