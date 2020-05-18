import UIKit
import Carbon

struct AlphabetItem: IdentifiableComponent, Hashable {
    var alphabet: String

    init(_ alphabet: String) {
        self.alphabet = alphabet
    }

    func renderContent() -> AlphabetView {
        .loadFromNib()
    }

    func render(in content: AlphabetView) {
        content.label.text = alphabet
    }
}

final class AlphabetView: UIView, NibLoadable {
    @IBOutlet var label: UILabel! {
        didSet {
            label.font = .systemFont(ofSize: 24)
        }
    }
}
