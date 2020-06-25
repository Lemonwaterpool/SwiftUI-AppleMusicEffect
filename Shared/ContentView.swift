//
//  ContentView.swift
//  Shared
//
//  Created by H Chan on 2020/06/24.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isZoomed = false
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    Image("album")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 30 : 0)
                        .shadow(radius: 12)
                    if isZoomed == false {
                        Text("Taylor Swift - 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                        Spacer()
                    }
                }
                
                if isZoomed == true {
                    Text("Taylor Swift - 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                        .padding(.bottom, 60)
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: isZoomed ? 400 : 60)
            .background(Color(white: 0.9))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
