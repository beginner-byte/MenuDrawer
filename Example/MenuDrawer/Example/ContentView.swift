//
//  ContentView.swift
//  Example
//
//  Created by Gemini on 2024/8/4.
//

import SwiftUI
import MenuDrawer

struct ContentView: View {
    @State var selected = "Home"
    
    @State var show = true
    
    var body: some View {
        let configuration = MenuConfiguration($selected,$show)
        
        return MenuDrawer(configuration:configuration) {
            MainView(selected: $selected)
        } tabItems: {
            HomePage().tag("Home")
            HistoryPage().tag("History")
            NotificationsPage().tag("Notifications")
            SettingsPage().tag("Settings")
            HelpPage().tag("Help")
        }
        .background(Color.blue.ignoresSafeArea())
    }
}

struct MainView : View {
    
    @Binding var selected:String
    
    
    
    @Namespace var animation
    
    var body: some View {
        // menu ...
        VStack(alignment: .leading,spacing: 15){
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 70,maxHeight: 70)
                .cornerRadius(10)
            // padding top for top close button ...
                .padding(.top,50)
            
            // Profile
            VStack(alignment: .leading,spacing: 3){
                
                Text("Natual")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                
                Button(action: {}, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .opacity(0.7)
                })
            }
            // menu items ....
            VStack(alignment: .leading,spacing:10){
                
                DrawerButton(title: "Home", image: "house", selected: $selected, animation: animation)
                DrawerButton(title: "History", image: "house", selected: $selected, animation: animation)
                DrawerButton(title: "Notifications", image: "house",selected:$selected, animation: animation)
                DrawerButton(title: "Settings", image: "house", selected:$selected, animation: animation)
                DrawerButton(title: "Help", image: "house", selected:$selected, animation: animation)
                
            }
            .padding(.leading,-15)
            .padding(.top,50)
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        Spacer()
    }
}


struct HomePage:View {
    
    var body: some View{
        NavigationView{
            Text("Home")
        }
    }
}

struct HistoryPage:View {
    
    var body: some View{
        Text("History")
    }
    
    
}

struct NotificationsPage:View {
    
    var body: some View{
        Text("Notifications")
    }
}


struct SettingsPage:View {
    
    var body: some View{
        Text("Settings")
    }
}

struct HelpPage:View {
    
    var body: some View{
        Text("Help")
    }
}



#Preview {
    ContentView()
}
