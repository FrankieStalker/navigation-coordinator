import SwiftUI

struct TabOneChild: View {
    struct Output {
        var gotToParent: () -> Void
    }
    
    var output: Output
    
    var body: some View {
        Button {
            self.output.gotToParent()
        } label: {
            Text("Go to parent")
        }
    }
}
