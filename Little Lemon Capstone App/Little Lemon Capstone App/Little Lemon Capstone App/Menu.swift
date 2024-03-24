//
//  Menu.swift
//  Little Lemon Capstone App
//
//  Created by Jayson Sawat on 23/03/2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Dish.entity(),
        sortDescriptors: [],
        animation: .default)
    private var dishes: FetchedResults<Dish>
    
    @State private var searchText = ""
    
    var body: some View {
        VStack{
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
            
            // Search bar
            Group {
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
                                
                                HStack {
                                    Image(systemName: "magnifyingglass.circle.fill")
                                        .resizable()
                                        .foregroundColor(Color("ButtonColor1"))
                                        .frame(width: 40, height: 40)
                                    
                                    TextField(" Search", text: $searchText)
                                        .padding(10)
                                        .background(Color("ButtonColor1"))
                                        .frame(width: 120)
                                        .cornerRadius(20)
                                        .padding(.leading, 5)
                                }
                                .padding(.top, 10)
                                
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
                .frame(height: 300)
            }
            
            // Menu Breakdown
            Group{
                VStack(alignment: .leading){
                    Text("ORDER FOR DELIVERY!")
                        .font(Font.system(size: 18, weight: .bold))
                    
                    HStack {
                        Button("Starters") {
                            print("Starters clicked")
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color("PrimaryColor1"))
                        .background(Color("ButtonColor1"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Mains") {
                            print("Mains clicked")
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color("PrimaryColor1"))
                        .background(Color("ButtonColor1"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Desserts") {
                            print("Desserts clicked")
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color("PrimaryColor1"))
                        .background(Color("ButtonColor1"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Drinks") {
                            print("Drinks clicked")
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color("PrimaryColor1"))
                        .background(Color("ButtonColor1"))
                        .cornerRadius(13)
                        
                    }
                    Divider()
                        .background(Color("ButtonColor1"))
                        .padding(.top, 10)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 10)
                
            }
            
            // Menu Items
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                Group{
                    List {
                        ForEach(dishes, id: \.self) { dish in
                            if let dishEntity = dish as? Dish {
                                VStack{
                                    HStack{
                                        // Menu Item text
                                        VStack(alignment: .leading){
                                            Text(dish.title ?? "")
                                                .font(Font.system(size: 16, weight: .bold))
                                                .padding(.bottom, 2)
                                                .foregroundColor(Color.black)
                                            
                                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
                                                .multilineTextAlignment(.leading)
                                                .font(Font.system(size: 16, weight: .regular))
                                                .foregroundColor(Color("PrimaryColor1"))
                                                .lineLimit(2)
                                                .truncationMode(.tail)
                                            
                                            Text("$\(dish.price ?? "")")
                                                .font(Font.system(size: 16, weight: .bold))
                                                .padding(.top, 2)
                                                .foregroundColor(Color("PrimaryColor1"))
                                        }
                                        
                                        Spacer()
                                        
                                        // Menu Item image
                                        AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                                            switch phase {
                                            case .empty : Image(systemName: "exclamationmark.icloud")
                                                    .foregroundColor(Color("ButtonColor1"))
                                                
                                            case .success(let image):
                                                image.resizable()
                                                    .scaledToFit()
                                                
                                            case .failure(_):
                                                Image(systemName: "exclamationmark.icloud")
                                                    .foregroundColor(Color("ButtonColor1"))
                                            @unknown default:
                                                Image(systemName: "exclamationmark.icloud")
                                                    .foregroundColor(Color("ButtonColor1"))
                                            }
                                            
                                        }
                                        .frame(width: 70, height: 70)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        .onAppear {
            getMenuData()
        }
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    private func getMenuData() {
        PersistenceController.shared.clear()
        
        let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let url = URL(string: serverURLString)!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let menuList = try JSONDecoder().decode(MenuList.self, from: data)
                
                for menuItem in menuList.menu {
                    let dish = Dish(context: viewContext)
                    dish.title = menuItem.title
                    dish.image = menuItem.image
                    dish.price = menuItem.price
                    // Additional properties can be set if needed
                }
                
                // Save changes to the database
                try? viewContext.save()
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
