////
////  ContentView.swift
////  FilmJournal
////
////  Created by Ronald Jabouin on 10/15/21.
////
//
import SwiftUI



struct HomeView: View {

   // @ObservedObject var filmRolls = FilmRolls()
    @State private var showingSheet = false
    @StateObject var vm = coreDataViewModel()
    var roll: FilmRollEntity
    
    
    
    var body: some View {
        let rollDate = roll.dateString
        let rollTime = roll.timeString
        let dateFormatter = DateFormatter()
        NavigationView{
          
            List{
                ForEach(vm.savedEntities) { entity in
                    //FilmRollCardView(roll: roll)
                    NavigationLink(destination: FilmRollDetailView(roll: entity)) {
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
                .onDelete(perform: vm.deleteRoll)
            }
            
                
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                
                }
                
                ToolbarItem(placement: .automatic) {
                   EditButton()
                
                }
            }
            
            .navigationTitle("Film Journal")
        }
        .sheet(isPresented: $showingSheet) {
            AddRollSheet()
               }
    }   
}

