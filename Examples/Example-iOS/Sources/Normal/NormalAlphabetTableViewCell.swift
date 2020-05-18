import UIKit

final class NormalAlphabetTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet var label: UILabel! {
        didSet {
            label.font = .systemFont(ofSize: 24)
        }
    }
}
