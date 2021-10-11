import SwiftUI

struct RepositoryRow: View {
  var repo: Repository
    var body: some View {
      HStack{
      Text(repo.name).font(
        .headline
      )
      Text(repo.itemDescription ?? "").font(
        .subheadline
      )
        NavigationLink("", destination: WebView(request: URLRequest(url:URL(string: repo.htmlURL)!)))}
  }
}
