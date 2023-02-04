
import SwiftUI

@main
struct iOSExploringChartsApp: App {
    var body: some Scene {
        WindowGroup {
            MoreBarChart(
                dailySales: defaultDailySales,
                min: 0.0,
                max: 700.0
            )
        }
    }
}
