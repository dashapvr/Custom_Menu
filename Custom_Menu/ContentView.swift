//
//  ContentView.swift
//  Custom_Menu
//
//  Created by Дарья Пивовар on 11.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @State var show = true
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .offset(x: -90, y: -125)
                    
                    Text("Hi,")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.trailing, 50)
                        .offset(x: -130, y: -130)
                    
                    Text("Daria")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.trailing)
                        .offset(x: -130, y: -130)
                    
                    Button(action: {
                        self.index = 0
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image ("catalog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(self.index == 0 ? Color("color2") : Color.white)
                        
                        Text("Catalogue")
                            .fontWeight(.bold)
                            .foregroundColor(self.index == 0 ? Color("color2") : Color.white)
                    }
                    .padding(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(self.index == 0 ? Color("color2").opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .offset(x: -90, y: -120)
                    
                    Button(action: {
                        self.index = 1
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image("cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(self.index == 1 ? Color("color2") : Color.white)
                        
                        Text("Cart")
                            .fontWeight(.bold)
                            .foregroundColor(self.index == 1 ? Color("color2") : Color.white)
                    }
                    .padding(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(self.index == 1 ? Color("color2").opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .offset(x: -110, y: -100)
                    
                    Button(action: {
                        self.index = 2
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image("favorites")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(self.index == 2 ? Color("color2") : Color.white)
                        
                        Text("Favorites")
                            .fontWeight(.bold)
                            .foregroundColor(self.index == 2 ? Color("color2") : Color.white)
                    }
                    .padding(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(self.index == 2 ? Color("color2").opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .offset(x: -90, y: -80)
                    
                    Button(action: {
                        self.index = 3
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image("orders")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(self.index == 3 ? Color("color2") : Color.white)
                        
                        Text ("My Orders")
                            .fontWeight(.bold)
                            .foregroundColor(self.index == 3 ? Color("color2") : Color.white)
                    }
                    .padding(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(self.index == 3 ? Color("color2").opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .offset(x: -83, y: -60)
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color("color2"))
                        .offset(x: -80, y: -10)
                    
                    Button(action: {
                        //
                    }) {
                        Image("exit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.pink)
                        
                        Text("Out")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .cornerRadius(10)
                    .offset(x: -100, y: 40)
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image(systemName: self.show ? "xmark.circle" : "line.3.horizontal")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    Text(self.index == 0 ? "Catalogue" : (self.index == 1 ? "Cart" : (self.index == 2 ? "Favorites" : "My Orders")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader { _ in
                    VStack {
                        if self.index == 0 {
                            Catalogue()
                        }
                        else if self.index == 1 {
                            Cart()
                        }
                        else if self.index == 2 {
                            Favorites()
                        } else {
                            Orders()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(Color("color1").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Catalogue: View {
    var body: some View {
        VStack {
            Text("Catalogue")
        }
    }
}

struct Cart: View {
    var body: some View {
        VStack {
            Text("Cart")
        }
    }
}

struct Favorites: View {
    var body: some View {
        VStack {
            Text("Favorites")
        }
    }
}

struct Orders: View {
    var body: some View {
        VStack {
            Text("My orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
