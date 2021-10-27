
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
    @State private var shotInformationTextfield = ""
    @State private var isEditing = false
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
                Section(header: Text("General Info (Recommended)")) {
                    TextField("Film Stock Used", text: $viewModel.filmRoll.stock)
                    TextField("Camera Used", text: $viewModel.filmRoll.cameraUsed)
                    
                    TextField("# of Exposures", value: $viewModel.filmRoll.numberOfPictures, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                        
                    TextField("Film ISO", value: $viewModel.filmRoll.iso, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Extra Info (Optional)")) {
                    TextField("Location(s) Shot", text: $viewModel.filmRoll.location)
                    TextField("Lens Information (mm and f stop)", text: $viewModel.filmRoll.lensInfo)
                    DatePicker("Start Date", selection: $viewModel.filmRoll.startDateEvent, displayedComponents: .date)
                    DatePicker("End Date", selection: $viewModel.filmRoll.endDateEvent, displayedComponents: .date)
                    TextField("Extra Notes: Time, Lighting Conditions, etc...", text: $viewModel.filmRoll.extraNotes)
                }
                
                Section(header: Text("Per Shot Information")) {
                    ForEach(viewModel.filmRoll.shotInformation, id: \.self) { shotInformation in
                        Text(shotInformation)
                    }
                    .onDelete { indices in
                        viewModel.filmRoll.shotInformation.remove(atOffsets: indices)
                    }

                    HStack {
                        TextEditor(text:$shotInformationTextfield)
                            .font(.custom("SF Pro", size: 18))
                            .frame(height: 50, alignment: .center)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
//                        TextField("Information for a shot ", text: $shotInformationTextfield)
                        Button(action: {
                            withAnimation {
                                viewModel.filmRoll.shotInformation.append(shotInformationTextfield)
                                shotInformationTextfield = ""
                                self.isEditing = true
                            }

                        }) {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel(Text("Add new person"))
                        }
                        .disabled(shotInformationTextfield.isEmpty ? true : false)
                        .opacity(shotInformationTextfield.isEmpty ? 0.1 : 1.0)
                        

                    }
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

