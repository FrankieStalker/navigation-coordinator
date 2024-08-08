import SwiftUI

public struct TabOneChild: View {
    public struct Output {
        var gotToParent: () -> Void
        
        public init(gotToParent: @escaping () -> Void) {
            self.gotToParent = gotToParent
        }
    }
    
    var output: Output
    
    public init(output: Output) {
        self.output = output
    }
    
    public var body: some View {
        Button {
            self.output.gotToParent()
        } label: {
            Text("Go to parent")
        }
    }
}
