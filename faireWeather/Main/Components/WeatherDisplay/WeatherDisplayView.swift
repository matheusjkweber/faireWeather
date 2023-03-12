//
//  WeatherDisplayView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class WeatherDisplayView: UIView {
    fileprivate lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "weatherTemplate"))
        return imageView
    }()
    
    fileprivate lazy var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "16"
        tempLabel.font = UIFont.boldSystemFont(ofSize: 48.0)
        return tempLabel
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Light Cloud"
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
        addSubview(weatherImageView)
        addSubview(tempLabel)
        addSubview(descriptionLabel)
    }
    
    func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }

        weatherImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-48.0)
            make.height.width.equalTo(96.0)
            make.top.equalToSuperview()
        }

        tempLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.width.equalTo(96.0)
            make.left.equalTo(weatherImageView.snp.right).offset(8.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(24.0)
            make.top.equalTo(tempLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

