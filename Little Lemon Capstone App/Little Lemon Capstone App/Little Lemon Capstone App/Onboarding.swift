import SwiftUI


let kFirstName = "first_name_key"
let kLastName = "last_name_key"
let kEmail = "email_key"
let kIsLoggedIn = "is_logged_in_key"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                // Navigation Header
                HStack {
                    Spacer()
                    Image("logo")
                        .padding(.leading)
                    Spacer()
                }
                .padding([.leading, .trailing])
                
                ZStack{
                    Rectangle().foregroundColor(Color("PrimaryColor1"))
                    VStack(){
                        HStack{
                            Text("Little Lemon")
                                .foregroundColor(Color("PrimaryColor2"))
                                .font(Font.custom("Georgia", size: 40))
                                .bold()
                                .padding([.leading], 20)
                            Spacer()
                        }
                        .frame(height: 45)
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("Georgia", size: 30))
                                    .fontWeight(.medium)
                                    .frame(height: 40)
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 16, weight: .medium))
                            }
                            
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Image("Hero image")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .clipShape(Rectangle())
                                .cornerRadius(15)
                                .frame(width: 150, height: 150)
                        }
                        .padding([.leading, .trailing])
                        .padding(.bottom, 20)
                    }
                    
                }
                .frame(height: 240)
                
                VStack(alignment: .leading) {
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    
                    Text("First Name*").padding([.leading, .top])
                    TextField("First Name", text: $firstName)
                        .padding([.leading, .trailing])
                        .padding([.bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    
                    Text("Last Name*").padding([.leading, .top])
                    TextField("Last Name", text: $lastName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    
                    Text("Email*").padding([.leading, .top])
                    TextField("Email", text: $email)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                }
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && isValidEmail(email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        isLoggedIn = true
                    }
                }
                .font(Font.system(size: 18, weight: .medium))
                .frame(width: 150)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 10)
                .foregroundColor(Color.white)
                .background(Color("PrimaryColor2"))
                .cornerRadius(10)
                
                Spacer()
            }
            .onAppear {
                // Check if user is logged in
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
