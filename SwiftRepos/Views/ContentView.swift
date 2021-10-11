import SwiftUI

struct ContentView: View {
  @State var searchField: String = ""
  @State var displayedRepos = [Repository]()
  @ObservedObject var viewModel = ViewModel()
  // @ObservedObject instance of ViewModel
  
  // @State var searchField
  // @State var displayedRepos
  
  
  var body: some View {
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.viewModel.search(searchText: self.searchField)
      self.displayRepos()
    })
    NavigationView{
    VStack{
      	TextField("Search repo", text: binding)
      List(
        displayedRepos, id: \.id) {
        displayedRepo in
          RepositoryRow(repo: displayedRepo)
      }.navigationBarTitle(Text("Swift Repos"))
    // replace the generic text above with a VStack as instructed
    }.onAppear(perform: loadData)
  }

  }
  
  func loadData() {
    Parser().fetchRepositories { (repos) in
      self.viewModel.repos = repos
      self.displayedRepos = repos
    }
  }

  func displayRepos() {
    if searchField == "" {
      displayedRepos = viewModel.repos
    } else {
      displayedRepos = viewModel.filteredRepos
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
