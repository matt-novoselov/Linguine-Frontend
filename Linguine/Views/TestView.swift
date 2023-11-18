import SwiftUI

struct WavePatternView: View {
    let wavePattern: [Int]

    init(wavePattern: [Int]) {
        self.wavePattern = wavePattern
    }

    var body: some View {
        VStack {
            Text("Wave Pattern:")
            VStack(spacing: 20){
                ForEach(wavePattern, id: \.self) { value in
                    VStack{
                        Circle()
                            .frame(width: 60)
                            .foregroundColor(.blue)
                            .padding(.leading, CGFloat(value))
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    let wavePattern = generateWavePattern(length: 20)

    var body: some View {
        WavePatternView(wavePattern: wavePattern)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Function to generate the wave pattern
func generateWavePattern(length: Int) -> [Int] {
    let M = [0, 25, 75, 125, 150, 125, 75, 25]
    let customStartIndex = 7
    let count = (length + customStartIndex) / M.count + 1

    let repeatedM = Array(repeating: M, count: count).flatMap { $0 }
    let startIndex = customStartIndex - 1
    let endIndex = length + startIndex - 1

    return Array(repeatedM[startIndex..<endIndex])
}
