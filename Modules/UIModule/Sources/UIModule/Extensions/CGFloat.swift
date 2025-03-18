//
//  CGFloat.swift
//  UIModule
//
//  Created by Mohammed Essam on 18/03/2025.
//

import Foundation
import SwiftUI

// MARK: - Sizes
//
@MainActor
public
extension CGFloat {
    static var screenBounds: CGRect {
        UIScreen.main.bounds
    }

    static var screenHeight: CGFloat {
        screenBounds.height
    }
    
    static var screenWidth: CGFloat {
        screenBounds.width
    }
    
    static var verticalSpace: CGFloat {
        screenHeight * 0.02
    }
    
    static var horizontalSpace: CGFloat {
        screenWidth * 0.04
    }
    
    static var buttonHeight: CGFloat {
        screenHeight * 0.06
    }
    
    static var buttonWidth: CGFloat {
        screenWidth * 0.34
    }
    
    static var radius: CGFloat {
        screenHeight * 0.015
    }
    
    static var textFieldHeight: CGFloat {
        screenHeight * 0.07
    }
}
