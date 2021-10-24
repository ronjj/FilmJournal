
import SwiftUI

struct FilmRollDetailsView: View {
    // MARK: - State
    
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditFilmRollSheet = false
    
    // MARK: - State (Initialiser-modifiable)
    
    var filmRoll: FilmRoll
    
    // MARK: - UI Components
    
    private func editButton(action: @escaping () -> Void) -> some View {
        Button(action: { action() }) {
            Text("Edit")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Roll Details")) {
                Text("Film Stock: \(filmRoll.stock) ")
                Text("Camera Used: \(filmRoll.cameraUsed) ")
                Text("ISO: \(filmRoll.iso) ")
                Text("# of Exposures: \(filmRoll.numberOfPictures) ")
                Text("Extra Notes: \(filmRoll.extraNotes) ")
            }
            
            Section(header: Text("Extra Info")) {
                Text("Locaiton(s): \(filmRoll.location) ")
                Text("Dates Shot: \(filmRoll.startDateString) -> \(filmRoll.endDateString) ")
                
                
            }
        }
        .navigationBarTitle(filmRoll.stock)
        .navigationBarItems(trailing: editButton {
            self.presentEditFilmRollSheet.toggle()
        })
        .onAppear() {
            print("BookDetailsView.onAppear() for \(self.filmRoll.stock)")
        }
        .onDisappear() {
            print("BookDetailsView.onDisappear()")
        }
        .sheet(isPresented: self.$presentEditFilmRollSheet) {
            FilmRollEditView(viewModel: FilmRollViewModel(filmRoll: filmRoll), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
}
