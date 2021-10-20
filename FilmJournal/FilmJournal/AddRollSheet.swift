//
//  AddRollSheet.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct AddRollSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var filmRolls: FilmRolls
    
    @State private var rollDate = Date()
    @State private var rollStock: String = ""
    @State private var rollISO: String = ""
    @State private var rollNotes: String = ""
    @State private var rollCameraUsed: String = ""
    @State private var rollLocation: String = ""
    @State private var rollTime = Date()
    
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name of Film Stock", text: $rollStock)
                
                TextField("Camera Used", text: $rollCameraUsed)
                
                TextField("Location", text: $rollLocation)
                   
                TextField("Film ISO", text: $rollISO)
                    .keyboardType(.decimalPad)

                DatePicker(selection: $rollDate, in: ...Date(), displayedComponents: .date) {
                    Text("Date Used")
                }
                DatePicker("Timed Used", selection: $rollTime, displayedComponents: .hourAndMinute)
                TextField("Extra Notes About Film", text: $rollNotes)
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                    let item = FilmRoll(stock: self.rollStock, iso: self.rollISO, cameraUsed: self.rollCameraUsed, location: self.rollLocation, dateStringEvent: self.rollDate,timeStringEvent: self.rollTime, notes: self.rollNotes)
                    self.filmRolls.filmRolls.append(item)
                }label: {
                    Text("Create Film Roll")
                }
               
            }
            .navigationTitle("Add Film Roll Sheet")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .foregroundColor(Color.red)
                }
            }
        }
    }
}

