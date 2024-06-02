//
//  ContentView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 31.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var selectedTab  = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AirTicketsView()
                .tabItem {
                    Label("Авиабилеты", image: .airtickets)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                .tag(0)
            HotelView()
                .tabItem {
                    Label("Отели", image: .hotel)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                .tag(1)
            CityView()
                .tabItem {
                    Label("Короче", image: .city)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                .tag(2)
            SubscriptionsView()
                .tabItem {
                    Label("Подписки", image: .subscriptions)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    Label("Профиль", image: .profile)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
