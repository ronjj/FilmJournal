//
//  FilmRollDetailView.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct FilmRollDetailView: View {
    
    var roll: FilmRoll
    
    var body: some View {
        
        List{
            Text("Film Stock: \(roll.stock)")
            Text("Date Shot: \(roll.dateString)")
            Text("Time Shot: \(roll.timeString)")
            Text("Extra Notes: \(roll.notes)")
            Text("Film ISO: \(roll.iso)")
            Text("Location Used: \(roll.location)")
            Text("Camera Used: \(roll.cameraUsed)")
            

        }
        .navigationTitle(roll.stock)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                   print("Button Pressed")
                } label: {
                    Text("Delete")
                }
                .foregroundColor(Color.red)
            }
        }
    }
   
}
