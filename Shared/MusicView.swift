//
//  MusicView.swift
//  SwiftUI-AppleMusicEffect
//
//  Created by H Chan on 2020/06/24.
//

import SwiftUI

struct MusicView: View {
    
    @Namespace private var expandAnimation
    
    @State private var isExpanded = false
    
    let screenBounds = UIScreen.main.bounds
    
    var imageFrame: CGFloat {
        isExpanded ? screenBounds.width * 0.7 : 48
    }
    
    var cornerRadius: CGFloat {
        isExpanded ? 20 : 0
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(cornerRadius)
                .scaleEffect(isExpanded ? 0.85 : 1)
            
            ZStack(alignment: .top) {
                Color.red
                    .frame(height: isExpanded ? screenBounds.height - 60 : 120)
                    .clipShape(CornerShape(corner: [.topLeft, .topRight], size: CGSize(width: cornerRadius, height: cornerRadius)))
                
                VStack {
                    HStack {
                        Image("album")
                            .resizable()
                            .frame(width: imageFrame, height: imageFrame)
                            .matchedGeometryEffect(id: "AlbumImage", in: expandAnimation)
                        
                        if !isExpanded {
                            Text("Taylor Swift - 1989")
                                .matchedGeometryEffect(id: "AlbumTitle", in: expandAnimation)
                            
                            Spacer()
                        }
                    }
                    
                    if isExpanded {
                        Text("Taylor Swift - 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: expandAnimation)
                        
                        Spacer()
                    }
                }
                .padding(.top, isExpanded ? 32 : 16)
                .padding(.horizontal)
                
            }
            .padding(.top, isExpanded ? 50 : 0)
            .frame(maxHeight: isExpanded ? screenBounds.height - 60 : 80)
            .shadow(radius: 5)
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
