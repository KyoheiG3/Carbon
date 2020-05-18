import UIKit

private struct Section {
    let title: String
    let rows: [String]
}

final class NormalAlphabetViewController: UIViewController {
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(NormalAlphabetTableViewCell.nib, forCellReuseIdentifier: NormalAlphabetTableViewCell.nibName)
        }
    }

    private lazy var section = [
        Section(title: "alphabet", rows: lowercasedAlphabet),
        Section(title: "ALPHABET", rows: uppercasedAlphabet)
    ]
    let lowercasedAlphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]
    let uppercasedAlphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Alphabet"
        tableView.tableFooterView = nil
    }
}

extension NormalAlphabetViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        section.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section[section].rows.count
    }
}

extension NormalAlphabetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        64
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderContent.loadFromNib()
        header.titleLabel.text = self.section[section].title
        return header
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NormalAlphabetTableViewCell.nibName, for: indexPath)
        if let cell = cell as? NormalAlphabetTableViewCell {
            cell.label.text = section[indexPath.section].rows[indexPath.row]
        }

        return cell
    }
}
