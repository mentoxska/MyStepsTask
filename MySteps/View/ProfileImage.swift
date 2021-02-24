//
//  CircleImage.swift
//  MySteps
//
//  Created by Branislav on 27/01/2021.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
            Image("profile-photo")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                .overlay(
//                    Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
