import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    
    func login() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        let isPasswordValid = password.count >= 7
        
        if isEmailValid && isPasswordValid {
            isLoggedIn = true
        } else {
            showAlert = true
            alertMessage = "You're trying to hack this account, police will put you in jail."
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 200.0, height: 44.0)
                    .border(.gray)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 200.0, height: 44.0)
                    .border(.gray)
                
                NavigationLink(destination: HomeView(email: email), isActive: $isLoggedIn) {
                    
               
                
                Button("Login", action: login)
                    .frame(width: 200, height: 44)
                    .background(.blue)
                    .foregroundStyle(.white)
            }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
