//
//  UserProfile.swift
//  Little Lemon Capstone App
//
//  Created by Jayson Sawat on 23/03/2024.
//

import SwiftUI

let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
let email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State var checkedOrderStatus = true
    @State var checkedPasswordChanges = true
    @State var checkedSpetialOffers = true
    @State var checkedNewsletters = true
    
    var body: some View {
        VStack {
            // Navigation Header
            HStack {
                Spacer()
                Image("logo")
                    .padding(.leading)
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing])
            
            ScrollView {
                VStack(alignment:.leading){
                    // Personal Info
                    Group {
                        
                        Text("Personal Information")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(Color("PrimaryColor1"))
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 12)
                            .padding(.bottom, 5)
                            .bold()
                        Text("Avatar")
                            .foregroundColor(Color.gray)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        
                        HStack {
                            Image("profile-image-placeholder")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            Button("Change") {
                                print("Change profile picture clicked!")
                            }
                            .font(Font.system(size: 16, weight: .medium))
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 10)
                            .foregroundColor(Color("ButtonColor1"))
                            .background(Color("PrimaryColor1"))
                            .cornerRadius(7)
                            .padding(10)
                            
                            Button("Remove") {
                                print("Remove profile picture clicked!")
                            }
                            .font(Font.system(size: 16, weight: .medium))
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 10)
                            .foregroundColor(Color("PrimaryColor1"))
                            .border(Color("PrimaryColor1"))
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    
                    // Texts
                    Group {
                        Text("First name")
                            .foregroundColor(Color.gray)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        
                        Text(firstName)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding([.leading, .trailing], 20)
                        
                        Text("Last name")
                            .foregroundColor(Color.gray)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        
                        Text(lastName)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding([.leading, .trailing], 20)
                        
                        Text("Email")
                            .foregroundColor(Color.gray)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        
                        Text(email)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding([.leading, .trailing], 20)
                        
                        Text("Phone number")
                            .foregroundColor(Color.gray)
                            .bold()
                            .padding([.leading, .trailing], 20)
                        
                        Text("(217) 555-0113")
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding([.leading, .trailing], 20)
                        
                    }
                    
                    // Notifications
                    Group {
                        Text("Email notifications")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(Color.black)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .bold()
                        HStack{
                            Image(systemName: checkedOrderStatus ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkedOrderStatus ? (Color("PrimaryColor1")) : Color.secondary)
                                .onTapGesture {
                                    self.checkedOrderStatus.toggle()
                                }
                            Text("Order statuses")
                                .foregroundColor(Color("PrimaryColor1"))
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 5)
                        HStack{
                            Image(systemName: checkedPasswordChanges ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkedPasswordChanges ? (Color("PrimaryColor1")) : Color.secondary)
                                .onTapGesture {
                                    self.checkedPasswordChanges.toggle()
                                }
                            Text("Password changes")
                                .foregroundColor(Color("PrimaryColor1"))
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 5)
                        HStack{
                            Image(systemName: checkedSpetialOffers ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkedSpetialOffers ? (Color("PrimaryColor1")) : Color.secondary)
                                .onTapGesture {
                                    self.checkedSpetialOffers.toggle()
                                }
                            Text("Special offers")
                                .foregroundColor(Color("PrimaryColor1"))
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 5)
                        HStack{
                            Image(systemName: checkedNewsletters ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkedNewsletters ? (Color("PrimaryColor1")) : Color.secondary)
                                .onTapGesture {
                                    self.checkedNewsletters.toggle()
                                }
                            Text("Newsletter")
                                .foregroundColor(Color("PrimaryColor1"))
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 5)
                    }
                }
            }
            
            
            // Buttons
            VStack{
                Button("Logout") {
                    // Clear login status in UserDefaults
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    // Dismiss the view
                    self.presentation.wrappedValue.dismiss()
                }
                .font(Font.system(size: 16, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 10)
                .foregroundColor(Color("PrimaryColor1"))
                .background(Color("PrimaryColor2"))
                .cornerRadius(7)
                .padding(20)
                
                HStack{
                    Button("Discard changes") {
                        print("Changes discarded!")
                    }
                    .font(Font.system(size: 16, weight: .medium))
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 10)
                    .foregroundColor(Color("PrimaryColor1"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color("PrimaryColor1"), lineWidth: 1)
                    )
                    
                    Button("Save changes") {
                        print("Changes saved!")
                    }
                    .font(Font.system(size: 16, weight: .medium))
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 10)
                    .foregroundColor(Color.white)
                    .background(Color("PrimaryColor1"))
                    .cornerRadius(7)
                    .padding(10)
                }
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
