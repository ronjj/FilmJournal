
import SwiftUI


enum HomeScreenSheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case addFilmRoll
    case info
    
}

struct FilmRollsListView: View {
  // MARK: - State
  
  @StateObject var viewModel = FilmRollsViewModel()
    @StateObject var viewModel2 = FilmRollViewModel()
  @State var presentAddFilmRollSheet = false
    @State private var activeSheet: HomeScreenSheets?
    

  
  // MARK: - UI Components
  
  private var addButton: some View {
    Button(action: { activeSheet = .addFilmRoll }) {
        Text("Add Film Roll")
                   .font(.headline)
                   .foregroundColor(.white)
                   .frame(height: 55)
                   .frame(width: UIScreen.screenWidth - 40)
                   .background(Color.pink)
                   .cornerRadius(10)
                   .padding()

    }
  }
  
  private func filmRowView(filmRoll: FilmRoll) -> some View {
    NavigationLink(destination: FilmRollDetailsView(filmRoll: filmRoll)) {
        VStack(alignment: .leading, spacing: 5) {
        Text(filmRoll.stock)
          .font(.headline)
          
        Text(filmRoll.cameraUsed)
          .font(.subheadline)
        Text("\(filmRoll.startDateString) → \(filmRoll.endDateString)")
            .font(.subheadline)
      }
       
      .padding(10)
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach (viewModel.filmRolls) { filmRoll in
            filmRowView(filmRoll: filmRoll)
        
        }
        
        .onDelete() { indexSet in
          viewModel.removeFilmRolls(atOffsets: indexSet)
        }
        
        
      }
        
      .navigationBarTitle("Film Journal")
      .toolbar{
          ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
            addButton
          }
          ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
            EditButton()
          }
          ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
              Button{
                  activeSheet = .info
              } label:{
                  Image(systemName: "info.circle")
              }
          }
          
      }
      .sheet(item: $activeSheet) { item in
          switch item {
          case .addFilmRoll:
              FilmRollEditView()
          case .info:
              InfoPage()
          }
      }
    //  .navigationBarItems(trailing: addButton)
      .onAppear() {
        print("BooksListView appears. Subscribing to data updates.")
        self.viewModel.subscribe()
      }
      .onDisappear() {
        // By unsubscribing from the view model, we prevent updates coming in from
        // Firestore to be reflected in the UI. Since we do want to receive updates
        // when the user is on any of the child screens, we keep the subscription active!
        //
        // print("BooksListView disappears. Unsubscribing from data updates.")
        // self.viewModel.unsubscribe()
      }
      .sheet(isPresented: self.$presentAddFilmRollSheet) {
        FilmRollEditView()
      }
    }
  }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
