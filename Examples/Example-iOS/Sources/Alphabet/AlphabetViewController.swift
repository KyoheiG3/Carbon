import UIKit
import Carbon

final class AlphabetViewController: UIViewController {
    enum ID {
        case lowercase
        case uppercase
    }

    @IBOutlet var tableView: UITableView!

    private let renderer = Renderer(
        adapter: UITableViewAdapter(),
        updater: UITableViewUpdater()
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Alphabet"
        renderer.target = tableView

        render()
    }

    func render() {
        renderer.render {
            Section(
                id: ID.lowercase,
                header: Header("alphabet"),
                cells: {
                    Group {
                        AlphabetItem("a")
                        AlphabetItem("b")
                        AlphabetItem("c")
                        AlphabetItem("d")
                        AlphabetItem("e")
                        AlphabetItem("f")
                        AlphabetItem("g")
                    }
                    Group {
                        AlphabetItem("h")
                        AlphabetItem("i")
                        AlphabetItem("j")
                        AlphabetItem("k")
                        AlphabetItem("l")
                        AlphabetItem("m")
                        AlphabetItem("n")
                    }
            })

            Section(
                id: ID.uppercase,
                header: Header("ALPHABET"),
                cells: {
                    Group {
                        AlphabetItem("A")
                        AlphabetItem("B")
                        AlphabetItem("C")
                        AlphabetItem("D")
                        AlphabetItem("E")
                        AlphabetItem("F")
                        AlphabetItem("G")
                    }
                    Group {
                        AlphabetItem("H")
                        AlphabetItem("I")
                        AlphabetItem("J")
                        AlphabetItem("K")
                        AlphabetItem("L")
                        AlphabetItem("M")
                        AlphabetItem("N")
                    }
            })
        }
    }
}
