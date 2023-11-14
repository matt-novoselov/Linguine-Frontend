import SwiftUI

struct APITestView: View {
    var body: some View {
        Button {
            Task {
                guard let url = URL(string: "https://mattapi.fun/get_stats") else {
                    print("Invalid url")
                    return
                }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    print(data ?? "No data")
                      print(response ?? "No response")
                }.resume()
            }
        }
        label: {
            Text("Fetch")
        }
    }
}

#Preview {
    APITestView()
}
