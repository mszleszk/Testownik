import Foundation

protocol ScopeFunction {}

extension ScopeFunction {
    @inline(__always) func also(block: (Self) -> ()) -> Self {
        block(self)
        return self
    }
    
    @inline(__always) func apply<R>(block: (Self) -> R) -> R {
        return block(self)
    }
}

extension NSObject: ScopeFunction {}
