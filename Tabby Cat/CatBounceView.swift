import SwiftUI

struct CatBounceView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> CatBounceViewController {

        let storyboard = UIStoryboard(name: "CatBounceScreen", bundle: .main)

        if let viewController =  storyboard.instantiateViewController(withIdentifier: "CatBounce") as? CatBounceViewController {
            return viewController
        } else {
            fatalError("Could not instantiate")
        }

    }
    
    func updateUIViewController(_ uiViewController: CatBounceViewController, context: Context) {
        // nothing here
    }

}

struct CatBounceView_Previews: PreviewProvider {
    static var previews: some View {
        CatBounceView()
    }
}
