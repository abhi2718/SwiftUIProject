//
//  ContentView.swift
//  slot-machine
//
//  Created by Abhishek Singh on 16/02/23.
//

import SwiftUI
struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            
            let p1 =  CGPoint(x: 0, y: 20)
            let p2 =  CGPoint(x: 0, y: rect.height - 20)
            let p3 =  CGPoint(x: rect.width/2, y: rect.height)
            let p4 =  CGPoint(x: rect.width, y: rect.height - 20)
            let p5 =  CGPoint(x: rect.width, y: 20)
            let p6 =  CGPoint(x: rect.width/2, y: 0)
            
            path.move(to: p6) // close the path at p6
            
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 15)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
        }
    }
}

enum Choice{
   case success,failure
}

struct ContentView: View {
    @State public var symbols = ["svg1","svg2","svg3"]
    @State public var numbers = [0,1,2]
    @State public var counter = 0
    @State private var showingAlert = false
    @State private var result = Choice.failure
    
   func  handleClick()->Void{
       self.numbers[0] = Int.random(in: 0...self.numbers.count-1)
       self.numbers[1] = Int.random(in: 0...self.numbers.count-1)
       self.numbers[2] = Int.random(in: 0...self.numbers.count-1)
       counter = counter + 1
       if numbers[0] == numbers[1] && numbers[1] == numbers[2]{
           showingAlert = true
           result = Choice.success
           counter = 0
       }
       if counter>5 {
           showingAlert = true
           result = Choice.failure
           counter = 0
       }
    }
    var body: some View {
        ZStack{
            Image("sunShine")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:80){
                HStack(alignment: VerticalAlignment.center, spacing: 60 ){
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        
                    Text("Time Machine")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        
                }.frame(width: Double.infinity,height: 50, alignment: Alignment.center)
                VStack(spacing:16){
                    HStack(spacing:36){
                       Hexagon()
                            .fill(.white)
                            .frame(width: 100,height: 120,alignment: Alignment.center)
                            .shadow(color: .gray, radius: 16, x: 4, y: 5)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .frame(width: 60,height: 60,alignment: Alignment.center)
                            )
                        Hexagon()
                             .fill(.white)
                             .frame(width: 100,height: 120,alignment: Alignment.center)
                             .shadow(color: .gray, radius: 16, x: 4, y: 5)
                             .overlay(
                                 Image(symbols[numbers[1]])
                                     .resizable()
                                     .frame(width: 60,height: 60,alignment: Alignment.center)
                             )
                    }
                    Hexagon()
                         .fill(.white)
                         .frame(width: 100,height: 120,alignment: .center)
                         .shadow(color: .gray, radius: 16, x: 4, y: 5)
                         .overlay(
                             Image(symbols[numbers[2]])
                                 .resizable()
                                 .frame(width: 60,height: 60,alignment: Alignment.center)
                         )
                    HStack(spacing:36){
                       Hexagon()
                            .fill(Color.white)
                            .frame(width: 100,height: 120,alignment: .center)
                            .shadow(color: Color.gray, radius: 16, x: 4, y: 5)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .frame(width: 60,height: 60,alignment: Alignment.center)
                            )
                        Hexagon()
                             .fill(.white)
                             .frame(width: 100,height: 120,alignment: .center)
                             .shadow(color: Color.gray, radius: 16, x: 4, y: 5)
                             .overlay(
                                 Image(symbols[numbers[1]])
                                     .resizable()
                                     .frame(width: 60,height: 60,alignment: Alignment.center)
                             )
                    }
                    
                }
                
//               Button(action: handleClick, label: {
//                   return RoundedRectangle(cornerRadius: 16)
//                       .fill(.white)
//                       .frame(width: 200,height: 50,alignment: .center)
//                       .overlay(
//                        Text("Swing")
//                       )
//                    }
//                )
                
//                Button(action: {}, label: {})
                
//                Button{
//
//                }label:{
//
//                }
                
//                HStack(alignment: VerticalAlignment.center, spacing: 16, content: {
//                    Image("svg1")
//                })
                
                               Button(action: handleClick, label: {
                                   RoundedRectangle(cornerRadius: 16)
                                       .fill(.white)
                                       .frame(width: 200,height: 50,alignment: .center)
                                       .overlay(
                                        Text("Spin")
                                       )
                                    }
                               ).alert(isPresented: $showingAlert) {
                                   switch(result){
                                   case .failure:
                                     return  Alert(
                                           title: Text("Ooopppsss!"),
                                           message: Text("Better luck next time!")
                                       )
                                   case .success:
                                    return   Alert(
                                           title: Text("Yahhh! you won"),
                                           message: Text("Born with the charm!")
                                       )
                                   }
                                  
                               }
                              
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
