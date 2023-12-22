import MapKit
import SwiftUI


struct MapView: View {
    var body: some View {

        VStack{
            
            if #available(iOS 17.0, *) {
                Map()
            } else {
               OldMapView() 
            }
        }
        
    }
}

struct OldMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 48.583328, longitude: 7.75)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Strasbourg"
        uiView.addAnnotation(annotation)
    }
}

#Preview {
    MapView()
}
