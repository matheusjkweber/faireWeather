//
//  WeatherDetailsView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class WeatherDetailsView: UIView, SetuppableView {
    fileprivate lazy var centerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        return view
    }()
    
    fileprivate lazy var primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
    }()
    
    fileprivate lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
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
        addSubview(centerView)
        centerView.addSubview(primaryLabel)
        centerView.addSubview(secondaryLabel)
    }
    
    func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        centerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        primaryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        secondaryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(primaryLabel.snp.right).offset(8.0)
            make.top.bottom.right.equalToSuperview()
        }
    }
    
    func setup(lowerText: String, higherText: String) {
        primaryLabel.text = "L: \(lowerText)"
        secondaryLabel.text = "H: \(higherText)"
        setupView()
    }
}
