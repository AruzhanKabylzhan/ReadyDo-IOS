import SwiftUI

struct LoginOptionsView: View {
    @State private var showProfileView = false
    @State private var showSignUpView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Заголовок "Welcome" слева с подчеркиванием цветом
                HStack {
                    Text("Welcome")
                        .font(.largeTitle) // Увеличиваем размер шрифта
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "67AD00"))
                        .padding(.bottom, 10) // Отступ снизу от заголовка
                        .frame(alignment: .leading) // Выравнивание текста по левому краю
                    
                    Spacer() // Пространство между заголовком и кнопками
                }
                .overlay(
                    Rectangle() // Подчеркивание цветом
                        .frame(height: 1)
                        .foregroundColor(Color(hex: "67AD00"))
                        .padding(.top, 5), // Отступ сверху от подчеркивания
                    alignment: .bottomLeading // Размещение подчеркивания внизу слева
                )
                
                Spacer() // Пространство между заголовком и кнопками
                
                // Кнопка "Sign in" с переходом на экран ProfileView
                NavigationLink(destination: ProfileView(), isActive: $showProfileView) {
                    Button(action: {
                        // Действие по нажатию "Sign in"
                        self.showProfileView = true
                    }) {
                        Text("Sign in")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "FE8000"))
                            .cornerRadius(12)
                            .padding(.horizontal, 20)
                    }
                }
                
                // Кнопка "Sign up" с переходом на экран регистрации (SignUpView)
                NavigationLink(destination: SignUpView(), isActive: $showSignUpView) {
                    Button(action: {
                        // Действие по нажатию "Sign up"
                        self.showSignUpView = true
                    }) {
                        Text("Sign up")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "FE8000"))
                            .cornerRadius(12)
                            .padding(.horizontal, 20)
                    }
                }
                
                Spacer() // Пространство под кнопками для выравнивания по центру
            }
            .padding(.horizontal, 20)
            .navigationBarHidden(true) // Скрыть навигационную панель
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOptionsView()
    }
}

// Эмуляция SignUpView (регистрационного экрана)
