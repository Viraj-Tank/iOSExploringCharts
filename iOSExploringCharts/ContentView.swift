
import SwiftUI
import Charts

struct ContentView: View {
    
    let min = 0.0
    let max = 400.0
    
    var body: some View {
        VStack {
            Text("iOS 16 Charts!")
                .font(.largeTitle)
            Chart {
                /// use annotation properties to anotate the particular barmark
                BarMark(
                    x: .value("Day", "Monday"),
                    y: .value("Sales", 200)
                )
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundColor(.blueViolet)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .foregroundStyle(by:.value("Day", "Mon1"))
                
                BarMark(
                    x: .value("Day", "Monday"),
                    y: .value("Sales", 100)
                )
                .foregroundStyle(by:.value("Day", "Mon2"))
                
                BarMark(
                    x: .value("Day","Tuesday"),
                    y: .value("Sales", 75.3)
                )
                .annotation(position: .top, alignment: .center) {
                    Image(systemName: "figure.dance")
                        .foregroundColor(.blueViolet)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .foregroundStyle(by:.value("Day", "Tues"))
                
                BarMark(
                    x: .value("Day","Wednesday"),
                    y: .value("Sales", 145.3)
                )
                .annotation {
                    Circle()
                        .stroke(lineWidth: 3)
                }
                .foregroundStyle(by:.value("Day", "Wednes"))
                
                BarMark(
                    x: .value("Day","Thursday"),
                    y: .value("Sales", 102.3)
                )
                .annotation {
                    Rectangle()
                }
                .foregroundStyle(by:.value("Day", "Thurs"))
                
                BarMark(
                    x: .value("Day","Friday"),
                    y: .value("Sales", 210.3)
                )
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundColor(.blueViolet)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .foregroundStyle(by:.value("Day", "Fri"))
                
                BarMark(
                    x: .value("Day", "Saturday"),
                    y: .value("Sales", 100)
                )
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundColor(.blueViolet)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .foregroundStyle(by:.value("Day", "Satur"))
            }
            .chartYScale(domain: min...max)
            .chartXAxis {  /// used to display the x axis parameters
                AxisMarks(position: .top)
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
