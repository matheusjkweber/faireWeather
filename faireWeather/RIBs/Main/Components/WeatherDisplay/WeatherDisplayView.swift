//
//  WeatherDisplayView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class WeatherDisplayView: UIView, SetuppableView {
    fileprivate lazy var centerView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "weatherTemplate"))
        return imageView
    }()
    
    fileprivate lazy var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = UIFont.boldSystemFont(ofSize: 48.0)
        return tempLabel
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 12.0)
        return descriptionLabel
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
        centerView.addSubview(weatherImageView)
        centerView.addSubview(tempLabel)
        centerView.addSubview(descriptionLabel)
    }
    
    func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        centerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        weatherImageView.snp.makeConstraints { make in
            make.height.width.equalTo(96.0)
            make.top.left.equalToSuperview()
        }

        tempLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(weatherImageView)
            make.left.equalTo(weatherImageView.snp.right).offset(8.0)
            make.right.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(24.0)
            make.top.equalTo(weatherImageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setup(weatherImage: UIImage?, tempText: String, descriptionText: String) {
        weatherImageView.image = weatherImage
        tempLabel.text = tempText
        descriptionLabel.text = descriptionText
    }
}

