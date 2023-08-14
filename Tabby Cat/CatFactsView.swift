import SwiftUI

struct CatFactsView: View {
    @StateObject var catFactsManager = CatFactsManager()
    var body: some View {
        VStack{
            Spacer()
            if let catFact = catFactsManager.catFact {
                Text(catFact.fact)
                    .padding()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
                Spacer()
            Button{
                catFactsManager.getCatFact()
            }label:{
                Text("Another Fact")
                    .padding()
                    .background(Color(.brown))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear{
            catFactsManager.getCatFact()
        }
        
        
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}
