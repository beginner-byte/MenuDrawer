//
//  SwiftUIView.swift
//
//
//  Created by Gemini on 2024/8/5.
//

import SwiftUI

public struct DrawerButton : View {
    
    public var title:String
    public var image:String
    
    // selectd tab
    @Binding public var selected:String
    
    //
    var animation:Namespace.ID
    
   public init(title: String, image: String, selected: Binding<String>, animation: Namespace.ID) {
        self.title = title
        self.image = image
        self._selected = selected
        self.animation = animation
    }
    
    public var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            HStack(spacing: 15){
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                Text(title)
                    .font(.subheadline)
            }
            .frame(maxWidth: 150,alignment: .leading)
            .foregroundStyle(title == selected ? Color.blue : .white)
            .padding(.vertical,12)
            .padding(.horizontal,10)
            .background{
                ZStack{
                    if(selected == title){
                        Color.white
                            .clipShape(
                                DrawerShape(
                                    corners: [.topRight,.bottomRight],
                                    radius: 10)
                            )
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            }
        })
    }
}



