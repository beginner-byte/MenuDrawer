//
//  SwiftUIView.swift
//  
//
//  Created by Gemini on 2024/8/5.
//

import SwiftUI
struct DrawerShape:Shape {
    
    let corners:UIRectCorner
    
    let radius:CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        return Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii:
                    CGSize(
                        width: radius,
                        height: radius
                    )
            ).cgPath
        )
    }
}
