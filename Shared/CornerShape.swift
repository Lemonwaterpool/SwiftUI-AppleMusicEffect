//
//  CornerShape.swift
//  SwiftUI-AppleMusicEffect
//
//  Created by H Chan on 2020/06/24.
//

import SwiftUI

struct CornerShape: Shape {
    
    var corner: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path(path.cgPath)
    }
    
    
}
