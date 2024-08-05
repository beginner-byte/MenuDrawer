//
//  File.swift
//
//
//  Created by Gemini on 2024/8/4.
//

import Foundation
import SwiftUI

public struct MenuConfiguration<T> where T: Hashable{
    
    let radius:CGFloat
    
    let offsetX:CGFloat
    
    @Binding public var selected:T
     
    @Binding public var open:Bool
    
    public init(_ selected:Binding<T>,_ open:Binding<Bool>,radius:CGFloat = 15,offsetX:CGFloat = 200) {
        self._selected = selected
        self._open = open
        self.radius = radius
        self.offsetX = offsetX
    }
    
}

extension MenuConfiguration {
    
    func builder<Content>(tabItems:() -> Content) -> some View where Content:View {
    
        return ZStack{
            Color.white
                .opacity(0.5)
                .cornerRadius(open ? radius:0)
                .shadow(color: .black.opacity(0.07), radius: 5,x: -5,y: 0)
                .offset(x: open ? -25 : 0)
                .padding(.vertical,30)
            
            Color.white
                .opacity(0.4)
                .cornerRadius(open ? radius:0)
                .shadow(color: .black.opacity(0.07), radius: 5,x: -5,y: 0)
                .offset(x:open ? -50 : 0)
                .padding(.vertical,60)
            
            TabView(selection: $selected,content: tabItems)
                .cornerRadius(open ? radius:0)
        }
        .scaleEffect(open ? 0.84:1)
        .offset(x: open ? offsetX :0)
        .ignoresSafeArea()
        .overlay (
            Button(action: {
                withAnimation(.spring()){
                    open.toggle()
                    print(open)
                }
            }, label: {
                
                VStack(spacing:5){
                    Capsule()
                        .fill(open ? .white : .primary)
                        .frame(width: 30,height: 3)
                        .rotationEffect(.init(degrees: open ? -50 : 0))
                        .offset(x:open ? 2 : 0,y: open ? 9 : 0)
                    
                    VStack(spacing:5){
                        
                        Capsule()
                            .fill(open ? .white : .primary)
                            .frame(width: 30,height: 3)
                        Capsule()
                            .fill(open ? .white : .primary)
                            .frame(width: 30,height: 3)
                            .offset(y: open ? -8 : 0)
                    }
                    .rotationEffect(.init(degrees: open ?  50 : 0))
                }
            })
            .padding()
            ,alignment:.topLeading
        )
    }
    
}






