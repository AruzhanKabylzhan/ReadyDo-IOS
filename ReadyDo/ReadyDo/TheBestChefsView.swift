import SwiftUI

struct Chef {
    let name: String
    let username: String
    let imageName: String
    let rating: Int
}

struct TheBestChefsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let chefs: [Chef] = [
        Chef(name: "Arman Nurlanuly", username: "arman.n", imageName: "arman_photo", rating: 4),
        Chef(name: "Ayazhan Askar", username: "ayazhan_a", imageName: "ayazhan_photo", rating: 5),
        Chef(name: "Asyl Maratova", username: "asyl_m", imageName: "asyl_photo", rating: 4),
        Chef(name: "Askhat Kim", username: "askhat_k", imageName: "askhat_photo", rating: 3),
        Chef(name: "Asem Kasparova", username: "asem_k", imageName: "asem_photo", rating: 5)
    ]
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .padding()
                }
                .frame(alignment: .leading)
                .padding(.leading)
                
                Spacer()
                
                Text("The Best Chefs")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                
                Spacer()
            }
            .padding()
            
            ScrollView {
                ForEach(chefs, id: \.username) { chef in
                    Button(action: {
                        // Действие при нажатии на кнопку повара
                        print("Selected chef: \(chef.name)")
                    }) {
                        HStack(spacing: 10) {
                            Image(chef.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(chef.name)
                                    .font(.headline)
                                
                                Text("@\(chef.username)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                ForEach(0..<chef.rating) { _ in
                                    Image("star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                }
                            }
                        }
                        .frame(height: 80)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(hex: "E1EFCC").opacity(1), radius: 5, x: 0, y: 2)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                    }
                    .buttonStyle(PlainButtonStyle()) // Убираем стиль кнопки
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(false)
    }
}

struct TheBestChefsView_Previews: PreviewProvider {
    static var previews: some View {
        TheBestChefsView()
    }
}
