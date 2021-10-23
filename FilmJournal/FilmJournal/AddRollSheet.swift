//
//  AddRollSheet.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

struct AddRollSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = coreDataViewModel()
    @State var textFieldText = ""
    
    
    
    //   @ObservedObject var filmRolls: FilmRolls
//    @State private var rollDate = Date()
//    @State private var rollStock: String = ""
//    @State private var rollISO: String = ""
//    @State private var rollNotes: String = ""
//    @State private var rollCameraUsed: String = ""
//    @State private var rollLocation: String = ""
//    @State private var rollTime = Date()
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Add New Film ROll....", text: $textFieldText)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(Color(.gray))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                guard !textFieldText.isEmpty else {return}
                vm.addRoll(text: textFieldText)
                textFieldText = ""
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth:.infinity)
                    .background(Color.pink)
                    .cornerRadius(10)
                
            }
            .padding(.horizontal)
        }
           
//        NavigationView{
//            Form{
//                TextField("Name of Film Stock", text: $rollStock)
//
//                TextField("Camera Used", text: $rollCameraUsed)
//
//                TextField("Location", text: $rollLocation)
//
//                TextField("Film ISO", text: $rollISO)
//                    .keyboardType(.decimalPad)
//
//                DatePicker(selection: $rollDate, in: ...Date(), displayedComponents: .date) {
//                    Text("Date Used")
//                }
//                DatePicker("Timed Used", selection: $rollTime, displayedComponents: .hourAndMinute)
//                TextField("Extra Notes About Film", text: $rollNotes)
//
//                Button{
//                    presentationMode.wrappedValue.dismiss()
//                    let item = FilmRoll(stock: self.rollStock, iso: self.rollISO, cameraUsed: self.rollCameraUsed, location: self.rollLocation, dateStringEvent: self.rollDate,timeStringEvent: self.rollTime, notes: self.rollNotes)
//                    self.filmRolls.filmRolls.append(item)
//                }label: {
//                    Text("Create Film Roll")
//                }
//
//            }
//            .navigationTitle("Add Film Roll Sheet")
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Cancel")
//                    }
//                    .foregroundColor(Color.red)
//                }
//            }
//        }
    }
}

