import SwiftUI

struct ProfileView: View {
    @State private var emailOrPhone = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isShowingLoginOptions = false // Для отслеживания отображения LoginOptionsView
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Заголовок "ReadyDo" и "with us" слева внизу
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
                    .padding(.leading, 20) // Отступ слева
                    .padding(.bottom, 100) // Отступ вниз от надписей
                    
                    Spacer() // Пространство между заголовком и полями ввода
                }
                
                // Поля ввода для email/телефона и пароля
                VStack(spacing: 20) {
                    // Email или телефон
                    ZStack(alignment: .trailing) {
                        TextField("Email or Phone", text: $emailOrPhone)
                            .padding(10)
                            .frame(height: 55)
                            .background(Color(hex: "E1EFCC"))
                            .cornerRadius(12)
                            .foregroundColor(.black)
                            .padding(.leading, 0)
                        
                        Image(systemName: "person")
                            .foregroundColor(Color(hex: "67AD00"))
                            .padding(.trailing, 10)
                    }
                    
                    // Пароль
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            TextField("Password", text: $password)
                                .padding(10)
                                .frame(height: 55)
                                .background(Color(hex: "E1EFCC"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                                .padding(.leading, 0)
                        } else {
                            SecureField("Password", text: $password)
                                .padding(10)
                                .frame(height: 55)
                                .background(Color(hex: "E1EFCC"))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                                .padding(.leading, 0)
                        }
                        
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(Color(hex: "67AD00"))
                                .padding(.trailing, 10)
                        }
                    }
                    
                    // Текст-кнопка "Забыли пароль?"
                    Button(action: {
                        // Действие по переходу на экран сброса пароля
                        // Например, NavigationLink или другая логика
                    }) {
                        Text("Forgot password?")
                            .foregroundColor(Color(.black))
                            .font(.footnote)
                            .padding(.bottom, 50) // Отступ вниз на 50 пикселей
                    }
                }
                .padding(.horizontal, 20)
                
                // Кнопка "Войти"
                Button(action: {
                    // Действие по выполнению входа
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "FE8000"))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                }
                
                // Кнопка "Continue with Google"
                Button(action: {
                    // Действие по входу через Google
                }) {
                    Text("Continue with Google")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "FE8000"))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .navigationBarHidden(true) // Скрыть навигационную панель
            .padding(.bottom, 20) // Добавить отступ вниз
            
            // Кнопка "Назад" слева внизу экрана с использованием NavigationLink
            .navigationBarItems(
                leading: NavigationLink(destination: LoginOptionsView(), isActive: $isShowingLoginOptions) {
                    EmptyView()
                }
                .hidden()
            )
            .overlay(
                Button(action: {
                    isShowingLoginOptions = true // Показать LoginOptionsView
                }) {
                    Image("arrow")
                        .resizable()
                        .frame(width: 35, height: 17)
                        .foregroundColor(Color(hex: "67AD00"))
                        .padding(20)
                }
                .frame(maxWidth: .infinity, alignment: .center) // Разместить посередине
                .padding(.bottom, 20) // Добавить отступ вниз
                , alignment: .bottomLeading // Размещение кнопки внизу слева
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

