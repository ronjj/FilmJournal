//
//  FilmRollCardView.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct FilmRollCardView: View {
    var roll: FilmRoll
    
    var body: some View {
        
        NavigationLink(destination: FilmRollDetailView(roll: roll)) {
            HStack{
                VStack (alignment: .leading, spacing: 15){
                    Text(roll.stock)
                    Text(roll.notes)
                    Text( "Date Shot: \(roll.dateString)")
                    Text("Time Used: \(roll.timeString)")
                }
                .padding(10)
                
                Spacer()
                
                HStack{
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.black)
                        .font(.caption)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}
