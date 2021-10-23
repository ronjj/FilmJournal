//
//  FilmRollCardView.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct FilmRollCardView: View {

    @StateObject var vm = coreDataViewModel()
    var roll: FilmRollEntity
    
    var body: some View {
        let rollDate = roll.dateString
        let rollTime = roll.timeString
        let dateFormatter = DateFormatter()
        
        NavigationLink(destination: FilmRollDetailView(roll: roll)) {
            HStack{
                VStack (alignment: .leading, spacing: 15){
                    Text(roll.stock ?? "")
                    Text(roll.notes ?? "")
                    Text("Date Shot:\(dateFormatter.string(from: rollDate!))")
                    Text("Time Shot:\(dateFormatter.string(from: rollTime!))")
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
