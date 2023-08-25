import SwiftUI
import Subsonic
struct CatImagesView: View {
    
    @State var catURL = "https://cataas.com/cat?q="
    
    var body: some View {
        AsyncImage(url: URL(string: catURL)!) { image in
            Spacer()
            image
                .resizable()
                .scaledToFit()
                .onAppear {
                    play(sound: "meow.m4a")
                }
            Spacer()
            Button("Load Another"){
            catURL += "1"
            }
            .buttonStyle(.borderedProminent)
        } placeholder: {
            ProgressView()
        }

    }
}
struct CatImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CatImagesView()
    }
}
