import SwiftUI
struct ContentView: View{
    var body: some View{
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40){
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.Secondary)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
                Text("Red color")
                    .foregroundColor(Color.theme.red)
                
            }

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
