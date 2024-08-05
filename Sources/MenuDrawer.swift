// The Swift Programming Language

import SwiftUI

public struct MenuDrawer<T,Content,TabItems>: View where Content : View,TabItems : View,T:Hashable {
    
    let configuration:MenuConfiguration<T>
    
    @ViewBuilder let content: () -> Content
    @ViewBuilder let tabItems: () -> TabItems

    public init(
        configuration:MenuConfiguration<T>,
        @ViewBuilder content:@escaping () -> Content,
        @ViewBuilder tabItems: @escaping () -> TabItems) {
            self.configuration = configuration
            self.content = content
            self.tabItems = tabItems
        }
    
    public var body: some View{
        
        ZStack{
            content()
            configuration.builder(tabItems: tabItems)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}












