import UIKit
import SwiftUI
import Carbon

final class HomeViewController: UIViewController {
    enum Destination {
        case normalAlphabet
        case alphabet
        case hello
        case pangram
        case kyoto
        case emoji
        case todo
        case form
        case kyotoSwiftUI
    }

    @IBOutlet var tableView: UITableView!

    private let renderer = Renderer(
        adapter: UITableViewAdapter(),
        updater: UITableViewUpdater()
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        renderer.target = tableView

        renderer.render {
            Header("EXAMPLES")
                .identified(by: \.title)

            HomeItem(title: "🔡 Normal Alphabet") { [weak self] in
                self?.push(.normalAlphabet)
            }

            HomeItem(title: "🔡 Alphabet") { [weak self] in
                self?.push(.alphabet)
            }

            HomeItem(title: "👋 Hello") { [weak self] in
                self?.push(.hello)
            }

            HomeItem(title: "🔠 Pangram") { [weak self] in
                self?.push(.pangram)
            }

            HomeItem(title: "⛩ Kyoto") { [weak self] in
                self?.push(.kyoto)
            }

            HomeItem(title: "😀 Shuffle Emoji") { [weak self] in
                self?.push(.emoji)
            }

            HomeItem(title: "📋 Todo App") { [weak self] in
                self?.push(.todo)
            }

            HomeItem(title: "👤 Profile Form") { [weak self] in
                self?.push(.form)
            }

            HomeItem(title: "⛩ Kyoto SwiftUI") { [weak self] in
                self?.push(.kyotoSwiftUI)
            }
        }
    }

    func push(_ destination: Destination) {
        let controller: UIViewController

        switch destination {
        case .normalAlphabet:
            controller = NormalAlphabetViewController()

        case .alphabet:
            controller = AlphabetViewController()

        case .hello:
            controller = HelloViewController()

        case .pangram:
            controller = PangramViewController()

        case .kyoto:
            controller = KyotoViewController()

        case .emoji:
            controller = EmojiViewController()

        case .todo:
            controller = TodoViewController()

        case .form:
            controller = FormViewController()

        case .kyotoSwiftUI:
            controller = HostingController(rootView: KyotoSwiftUIView())
        }

        navigationController?.pushViewController(controller, animated: true)
    }
}
