import Foundation

public class RBObservable<T> {
  
  typealias Listener = (T) -> ()
  
  var listener: Listener?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  func bind(_ listener: @escaping Listener) {
    self.listener = listener
    listener(value)
  }
  
  public init(_ value: T) {
    self.value = value
  }
  
  func notify(_ value: T) {
    self.value = value
  }
}
