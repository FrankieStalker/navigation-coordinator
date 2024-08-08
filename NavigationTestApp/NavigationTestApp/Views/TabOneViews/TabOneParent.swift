import SwiftUI

struct TabOneParent: View {
    struct Output {
        var gotToChild: () -> Void
    }
    
    var output: Output
    
    var body: some View {
        Group {
            Button {
                self.output.gotToChild()
            } label: {
                Text("Go to Child")
            }
        }
    }
}
