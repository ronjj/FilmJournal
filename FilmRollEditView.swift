
import SwiftUI

enum Mode {
  case new
  case edit
}

enum Action {
  case delete
  case done
  case cancel
}

struct FilmRollEditView: View {
  // MARK: - State
  
  @Environment(\.presentationMode) private var presentationMode
  @State var presentActionSheet = false

  // MARK: - State (Initialiser-modifiable)
  
  @ObservedObject var viewModel = FilmRollViewModel()
  var mode: Mode = .new
  var completionHandler: ((Result<Action, Error>) -> Void)?
  
  // MARK: - UI Components
  
  var cancelButton: some View {
    Button(action: { self.handleCancelTapped() }) {
      Text("Cancel")
    }
  }
  
  var saveButton: some View {
    Button(action: { self.handleDoneTapped() }) {
      Text(mode == .new ? "Done" : "Save")
    }
    .disabled(!viewModel.modified)
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("General Info")) {
          TextField("Film Stock Used", text: $viewModel.filmRoll.stock)
            TextField("Camera Used", text: $viewModel.filmRoll.cameraUsed)
            
            TextField("# of Exposures", value: $viewModel.filmRoll.numberOfPictures, formatter: NumberFormatter())
          TextField("Number of pages", value: $viewModel.filmRoll.iso, formatter: NumberFormatter())
            TextField("Extra Notes: Time, Lighting Conditions, etc...", text: $viewModel.filmRoll.extraNotes)
        }
          
          Section(header: Text("Extra Info")) {
            TextField("Location(s) Shot", text: $viewModel.filmRoll.location)
              TextField("Lens Information", text: $viewModel.filmRoll.lensInfo)
              DatePicker("Start Date", selection: $viewModel.filmRoll.startDateEvent, displayedComponents: .date)
              DatePicker("End Date", selection: $viewModel.filmRoll.endDateEvent, displayedComponents: .date)
              
              
          }
    
        
        if mode == .edit {
          Section {
            Button("Delete Film Roll") { self.presentActionSheet.toggle() }
              .foregroundColor(.red)
          }
        }
      }
      .navigationTitle(mode == .new ? "New Film Roll" : viewModel.filmRoll.stock)
      .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
      .navigationBarItems(
        leading: cancelButton,
        trailing: saveButton
      )
      .actionSheet(isPresented: $presentActionSheet) {
        ActionSheet(title: Text("Are you sure?"),
                    buttons: [
                      .destructive(Text("Delete film roll"),
                                   action: { self.handleDeleteTapped() }),
                      .cancel()
                    ])
      }
    }
  }
  
  // MARK: - Action Handlers
  
  func handleCancelTapped() {
    self.dismiss()
  }
  
  func handleDoneTapped() {
    self.viewModel.handleDoneTapped()
    self.dismiss()
  }
  
  func handleDeleteTapped() {
    viewModel.handleDeleteTapped()
    self.dismiss()
    self.completionHandler?(.success(.delete))
  }
  
  func dismiss() {
    self.presentationMode.wrappedValue.dismiss()
  }
}

