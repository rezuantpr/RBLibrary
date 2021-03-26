import Foundation

public class RBObservable<T> {
  
  public typealias Listener = (T) -> ()
  
  var listener: Listener?
  
  public var value: T {
    didSet {
      listener?(value)
    }
  }
  
  public func bind(_ listener: @escaping Listener) {
    self.listener = listener
    listener(value)
  }
  
  public init(_ value: T) {
    self.value = value
  }
  
  public func notify(_ value: T) {
    self.value = value
  }
}
