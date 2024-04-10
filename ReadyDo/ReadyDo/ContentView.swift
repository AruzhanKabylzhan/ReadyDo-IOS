import SwiftUI

struct ContentView: View {
    @State private var currentTab: Tab = .Home
    @State private var searchText = ""

    let recommendedItems: [RecommendedItem] = [
        RecommendedItem(imageName: "photo1", title: "Korean mandu", price: "$10.99"),
        RecommendedItem(imageName: "photo2", title: "Tomato soup", price: "$15.99"),
        RecommendedItem(imageName: "photo3", title: "Chicken with rice", price: "$12.49"),
        RecommendedItem(imageName: "photo4", title: "Fettuchini", price: "$8.99"),
        RecommendedItem(imageName: "photo5", title: "Product 5", price: "$19.99"),
        RecommendedItem(imageName: "photo6", title: "Product 6", price: "$14.99")
    ]

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentTab) {
                    // Home Tab
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Home")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()

                            SearchBar(searchText: $searchText)
                                .padding(.horizontal)
                                .padding(.bottom, 20)

                            // Buttons Section
                            HStack(spacing: 20) {
                                // Button for "The best chiefs"
                                NavigationLink(destination: TheBestChefsView()) {
                                    VStack(spacing: 20) {
                                        Image("chiefs")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60, height: 60)
                                        
                                        Text("The best chiefs")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(hex: "E1EFCC"), lineWidth: 2)
                                            .shadow(color: Color(hex: "E1EFCC").opacity(0.5), radius: 5, x: 0, y: 2)
                                    )
                                }

                                // Button for "The best meals"
                                Button(action: {
                                    print("The best meals button tapped")
                                }) {
                                    VStack(spacing: 20) {
                                        Image("meals")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60, height: 60)
                                        
                                        Text("The best meals")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(hex: "E1EFCC"), lineWidth: 2)
                                            .shadow(color: Color(hex: "E1EFCC").opacity(0.5), radius: 5, x: 0, y: 2)
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)

                            // Recommendation Section
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Recommendation")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)

                                LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                                    ForEach(recommendedItems, id: \.title) { item in
                                        NavigationLink(destination: ProductDetailView(title: item.title)) {
                                            VStack(spacing: 10) {
                                                Image(item.imageName)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 150)
                                                    .cornerRadius(10)
                                                    .padding(8)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(hex: "E1EFCC"), lineWidth: 2)
                                                            .shadow(color: Color(hex: "E1EFCC").opacity(0.5), radius: 5, x: 0, y: 2)
                                                    )

                                                Text(item.title)
                                                    .font(.caption)
                                                    .fontWeight(.bold)

                                                Text(item.price)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Добавляем стиль кнопки
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)

                            Spacer()
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }
                    .tabItem {
                        Image(systemName: Tab.Home.rawValue)
                            .modifier(TabIconModifier(tab: .Home, currentTab: currentTab))
                        Text("")
                    }
                    .tag(Tab.Home)
                }
            }
        }
        .overlay(
            VStack(spacing: 0) {
                Color("kPrimary")
                    .frame(height: 1)

                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        TabBarButton(tab: tab, currentTab: $currentTab)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 70)
                .background(Color("kPrimary"))
                .edgesIgnoringSafeArea(.bottom)
            },
            alignment: .bottom
        )
        .accentColor(Color.blue)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            TextField("Search", text: $searchText)
                .padding(10)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "E1EFCC"))
                .cornerRadius(12)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 20)
        .background(Color(hex: "E1EFCC"))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

struct TabBarButton: View {
    var tab: Tab
    @Binding var currentTab: Tab
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = tab
            }
        }) {
            VStack(spacing: 0) {
                Image(systemName: tab.rawValue)
                    .font(.title)
                    .foregroundColor(currentTab == tab ? .white : .white)
                    .background(
                        Circle()
                            .fill(currentTab == tab ? Color.green : Color.clear)
                            .frame(width: 40, height: 40)
                            .opacity(currentTab == tab ? 0.8 : 0)
                    )
                
                Text(tab.rawValue.capitalized)
                    .font(.caption)
                    .foregroundColor(currentTab == tab ? .white : .white)
            }
            .padding(.vertical, 8)
        }
    }
}

struct TabIconModifier: ViewModifier {
    var tab: Tab
    var currentTab: Tab
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(currentTab == tab ? .white : .white)
    }
}

struct RecommendedItem {
    let imageName: String
    let title: String
    let price: String
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case Catalog = "book"
    case Chat = "message"
    case Cart = "cart"
    case Profile = "person"
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
