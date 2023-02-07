//
//  ContentView.swift
//  ProfileApp0.1
//
//  Created by Abhishek Singh on 31/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("Splash screen")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                VStack(alignment: .center,spacing: 20){
                    Image("Vector")
                        .resizable()
                        .aspectRatio(contentMode: .fit) // need to understand
                        .frame(width: 280,height: 280,alignment: .bottom) // to give width , height and alignment
//                        .clipShape(Circle())  --> To make image circular
                        .shadow(color:.pink, radius: 16, x: 10, y: 10)
                    Text("Your Name")
                        .foregroundColor(.white)
                        .font(.system(size: 20)) // font size
                        .fontWeight(.bold)
                        .shadow(color: .pink, radius: 6, x: 6, y: 6)
                    Text("iOS | FrontEnd Developer")
                        .foregroundColor(.white)
                    HStack(spacing:40){
                        Image(systemName: "heart.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "message.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "phone.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50,alignment: .center)
                    .shadow(color: .red, radius: 20)
                }
                                VStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 160,height: 50,alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 16, x: 16, y: 16)
                        .overlay(
                            Text("Follow")
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .font(.system(size: 20))
                        )
                    HStack(alignment: .center, spacing: 60){
                        VStack{
                            Text("1732")
                                .font(.title)
                                .foregroundColor(.gray)
                            Text("flower")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        VStack{
                            Text("1732")
                                .font(.title)
                                .foregroundColor(.gray)
                            Text("flower")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        VStack{
                            Text("1732")
                                .font(.title)
                                .foregroundColor(.gray)
                            Text("flower")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        
                    }
                    Text("About You")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("I am frontend IOS developer ")
                        .foregroundColor(.white)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .opacity(0.7)
                    }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
