import SwiftUI

struct SignUpView: View {
    @State private var fullName = ""
    @State private var username = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("ReadyDo")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "67AD00"))
                        
                        Text("with us")
                            .font(.title)
                            .foregroundColor(Color(hex: "67AD00"))
                    }
                    Spacer() // Пространство между заголовком и полями ввода
                }
                .padding(.bottom, 30)
                .padding(.leading, 20)
                
                CustomTextField(placeholder: "Full Name", text: $fullName)
                CustomTextField(placeholder: "Username", text: $username)
                CustomTextField(placeholder: "Phone Number", text: $phoneNumber)
                CustomTextField(placeholder: "Email", text: $email)
                CustomSecureField(placeholder: "Password", text: $password, showPassword: $showPassword)
                CustomSecureField(placeholder: "Repeat Password", text: $repeatPassword, showPassword: $showPassword)
                
                HStack {
                    Spacer()
                }
                
                Button(action: {
                    // Действие по завершению регистрации
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "FE8000"))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                }
                
                Spacer() // Пространство перед кнопкой "назад"
                
                NavigationLink(destination: LoginOptionsView()) {
                    Image("arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(.bottom, 30)
                        .foregroundColor(Color(hex: "67AD00"))
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .navigationBarHidden(true) // Скрыть навигационную панель
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(10)
            .frame(height: 55)
            .background(Color(hex: "E1EFCC"))
            .cornerRadius(12)
            .padding(.horizontal, 20)
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    @Binding var showPassword: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if showPassword {
                TextField(placeholder, text: $text)
                    .padding(10)
                    .frame(height: 55)
                    .background(Color(hex: "E1EFCC"))
                    .cornerRadius(12)
                    .padding(.trailing, 0) // Увеличиваем правый отступ для иконки глаза
            } else {
                SecureField(placeholder, text: $text)
                    .padding(10)
                    .frame(height: 55)
                    .background(Color(hex: "E1EFCC"))
                    .cornerRadius(12)
                    .padding(.trailing, 0) // Увеличиваем правый отступ для иконки глаза
            }
            
            Button(action: {
                showPassword.toggle()
            }) {
                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color(hex: "67AD00"))
                    .padding(.trailing, 0)
            }
            .padding(.trailing, 20) // Отступ для иконки глаза от правой стороны поля
        }
        .padding(.horizontal, 20) // Отступы слева и справа для общего контейнера
    }
}
