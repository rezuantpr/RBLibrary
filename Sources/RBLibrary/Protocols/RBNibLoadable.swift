import UIKit

public protocol RBNibLoadable: class {
  static var nib: UINib { get }
}

public extension RBNibLoadable {
  static var nib: UINib {
    return UINib(nibName: name, bundle: nil)
  }
  
  static var name: String {
    return String(describing: self)
  }
}

public extension RBNibLoadable where Self: UIView {
  static func loadFromNib() -> Self {
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
      fatalError()
    }
    return view
  }
}
