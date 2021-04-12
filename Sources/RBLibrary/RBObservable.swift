import Foundation

open class RBObservable<T> {
  
  public typealias Listener = (T) -> ()
  
  open var listener: Listener?
  
  open var value: T {
    didSet {
      listener?(value)
    }
  }
  
  open func bind(_ listener: @escaping Listener) {
    self.listener = listener
    listener(value)
  }
  
  public init(_ value: T) {
    self.value = value
  }
  
  open func notify(_ value: T) {
    self.value = value
  }
}
