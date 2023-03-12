//
//  CitySelectedView.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit
import SnapKit

class CitySelectedView: UIView {
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Selected template"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
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
        addSubview(titleLabel)
    }
    
    func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(16.0)
        }
    }
}
