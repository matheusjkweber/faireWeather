//
//  MainView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class MainView: UIView {
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fill
        stackView.alignment = UIStackView.Alignment.top
        stackView.spacing = 16.0
        return stackView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
        setupLayout()
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
            make.top.equalTo(ScreenSize.topPadding)
            make.left.right.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(containerView.snp.bottom).offset(16.0)
        }
    }
    
    func addComponent(view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    func removeComponents() {
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
