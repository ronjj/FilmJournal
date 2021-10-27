//
//  ButtonStyle.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/25/21.
//

import SwiftUI



struct buttonStyle2: View{
    let title: LocalizedStringKey
    var body: some View{
        Button{
            
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(width: UIScreen.screenWidth - 40)
                .background(Color.pink)
                .cornerRadius(10)
                .padding()
        }
    }
}

struct mainButtonStyle: View {
    let title: LocalizedStringKey
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color:Color.blue.opacity(0.3), radius: 10, x: 0.0, y:10)
        }
       
        //.buttonStyle(PressableButtonStyle())
        .padding(40)
        
        
    
    }
}


struct smallerButtonStyle: View {
    let title: LocalizedStringKey
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 20)
                .frame(width: 30)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color:Color.blue.opacity(0.3), radius: 10, x: 0.0, y:10)
        }
       
        //.buttonStyle(PressableButtonStyle())
        .padding(40)
        
        
    
    }
}
