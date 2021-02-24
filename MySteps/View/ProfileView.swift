//
//  Profile.swift
//  MySteps
//
//  Created by Branislav on 27/01/2021.
//

import SwiftUI

struct ProfileView: View {
    @State var achievements: [String] = ["10k", "15k", "20k", "25k", "30k", "35k", "40k"]
    @State var isPresented = false
    @State private var opacity: Double = 1
    
    init() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 16, weight: .heavy),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Divider().background(Color.gray)
                    .offset(y: 3)
                ScrollView(.vertical) {
                    // profile photo
                    ProfileImage()
                        .padding(.top, 10)
                    
                    
//                    LineChartSwiftUI()//.frame( height: 600)
//                    GeometryReader { p in
                        VStack {
                            LineChartSwiftUI()
                                //use frame to change the graph size within your SwiftUI view
                                .frame(height: 190, alignment: .center)
                            
                        }//.frame(height: 400)
//                    }
                    
                    
                    
                    //Achievements
                    ScrollView(.horizontal, showsIndicators: false ) {
                        HStack {
                            if self.isPresented {
                                ForEach(achievements.indices){ ach in
                                    
                                    AchievementImage(image: Image(achievements[ach]))
                                        .padding(12)

                                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1)).combined(with: .move(edge: .bottom)))
                                        .animation(Animation.easeInOut(duration: 0.4)  .delay(0.3 * Double(ach)))
                                }
                            }
                        }
                        .onAppear { self.isPresented.toggle() }
    
                    }
     
                    Spacer()
                }
            }
            .navigationBarTitle("Neil Armstrong", displayMode: .inline)
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ExDivider: View {
    let color: Color = .gray
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

//var body: some View {
//
//    ZStack {
//
//        HStack {
//            ForEach(self.letters) { letter in
//                Text(letter.letter)
//                    .font(.custom("Menlo", size: 18))
//                    .fontWeight(.black)
//                    .frame(width: 38, height: 38, alignment: .center)
//                    .background(Color.red)
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
//                    .shadow(radius: 10, x: 10, y: 10)
//                    .transition(AnyTransition.offset(y: letter.arriving ? 250 :-250))
//                    .animation(Animation.linear(duration: 2).repeatCount(1))
//            }
//        }
//    }
//    .onReceive(timer) {_ in
//        print("TIMER")
//        if letters.count < 5 {
//        var letter = start.removeLast()
////            letter.arriving = true
////            letters.indices.forEach { idx in letters[idx].arriving = false }
//        letters = [letter] + letters
//
////                let last = letters.removeLast()
////                start = [last] + start
////                letter.arriving = false
//        }
//    }
