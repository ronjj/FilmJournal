////
////  ContentView.swift
////  FilmJournal
////
////  Created by Ronald Jabouin on 10/15/21.
////
//
import SwiftUI



struct HomeView: View {

    @ObservedObject var filmRolls = FilmRolls()
    @State private var showingSheet = false
    var body: some View {
        NavigationView{
          
            List{
                ForEach(filmRolls.filmRolls) { roll in
                    FilmRollCardView(roll: roll)
                }
                .onDelete(perform: removeItems)
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
            AddRollSheet(filmRolls: filmRolls)
               }
    }
    
    func removeItems(at offsets: IndexSet) {
        filmRolls.filmRolls.remove(atOffsets: offsets)
    }
   
}

