//
//  FilmRollDetailView.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct FilmRollDetailView: View {
    
    var roll: FilmRollEntity

    var body: some View {
        let rollDate = roll.dateString
        let rollTime = roll.timeString
        let dateFormatter = DateFormatter()
        
        List{
            //Text("Date Shot: \(roll.dateString ?? "")")
            // Text("Location Used: \(roll.location)")
            //Text("Time Shot: \(roll.timeString ?? "")")
         
            Text("Film Stock: \(roll.stock ?? "")")
            Text("Date Shot:\(dateFormatter.string(from: rollDate!))")
            Text("Time Shot:\(dateFormatter.string(from: rollTime!))")
            Text("Extra Notes: \(roll.notes ?? "")")
            Text("Film ISO: \(roll.iso ?? "")")
           
            Text("Camera Used: \(roll.cameraUsed ?? "")")
            

        }
        .navigationTitle(roll.stock ?? "")
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
