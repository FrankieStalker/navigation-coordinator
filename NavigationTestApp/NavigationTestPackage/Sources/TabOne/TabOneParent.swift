import SwiftUI

public struct TabOneParent: View {
    public struct Output {
        var gotToChild: () -> Void
        
        public init(gotToChild: @escaping () -> Void) {
            self.gotToChild = gotToChild
        }
    }
    
    var output: Output
    
    public init(output: Output) {
        self.output = output
    }
    
    public var body: some View {
        Group {
            Button {
                self.output.gotToChild()
            } label: {
                Text("Go to Child")
            }
        }
    }
}
