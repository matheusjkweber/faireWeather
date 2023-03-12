//
//  ScreenSize.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import UIKit

struct ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let topPadding =  UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
}
