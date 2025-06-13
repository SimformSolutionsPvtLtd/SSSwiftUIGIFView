import Cocoa
import SSSwiftUIGIFView
import Foundation

class TableViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    // Static method to present the TableViewController
    static func presentMacViewController() {

        // Create programmatically
        let windowController = NSWindowController()
        let tableViewController = TableViewController()
        
        // Create and configure table view with proper dimensions
        let scrollView = NSScrollView(frame: NSRect(x: 0, y: 0, width: 600, height: 600))
        scrollView.autohidesScrollers = true
        scrollView.hasVerticalScroller = true
        
        // Configure table view
        let tableView = NSTableView(frame: NSRect(x: 0, y: 0, width: 600, height: 600))
        tableView.delegate = tableViewController
        tableView.dataSource = tableViewController
        tableViewController.tableView = tableView
        
        // Set row height for proper GIF display
        tableView.rowHeight = 200
        
        // Configure column
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("MainColumn"))
        column.title = "GIF Examples"
        column.width = 580
        tableView.addTableColumn(column)
        
        scrollView.documentView = tableView
        
        // Create window with table
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.title = "SSSwiftUIGIFView Example"
        window.contentViewController = tableViewController
        
        // Set up scrollView constraints
        scrollView.frame = tableViewController.view.bounds
        scrollView.autoresizingMask = [.width, .height]
        tableViewController.view.addSubview(scrollView)
        
        windowController.window = window
        windowController.showWindow(nil)
    }
    
    @IBOutlet weak var tableView: NSTableView!
    
    // Sample data for the table - removed duplicates
    private var gifExamples = [
        "https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
        "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
        "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure table view if needed
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - NSTableViewDataSource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return gifExamples.count
    }
    
    // MARK: - NSTableViewDelegate
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // Try to reuse existing cell 
        let cellIdentifier = NSUserInterfaceItemIdentifier("TableViewCell")
        var cell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TableViewCell
        
        // Create a cell if not available
        if cell == nil {
            cell = TableViewCell()
            cell?.identifier = cellIdentifier
        }
        
        // Set up the cell for this row
        let cellWidth = tableView.frame.width - 20
        let cellHeight = tableView.rowHeight
        
        // Create a new GIF container for each cell
        let gifContainerView = GIFPlayerContainerView(frame: NSRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        gifContainerView.wantsLayer = true
        gifContainerView.layer?.backgroundColor = NSColor.clear.cgColor
        
        // Configure the cell layout
        cell?.setUpContainerView(withGifView: gifContainerView, cellWidth: cellWidth, cellHeight: cellHeight)
        
        // Configure the cell with the GIF URL
        if row < gifExamples.count {
            cell?.configure(gifName: gifExamples[row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 200
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = tableView.selectedRow
        guard selectedRow >= 0, selectedRow < gifExamples.count else { return }
        
        let selectedExample = gifExamples[selectedRow]
        print("Selected GIF: \(selectedExample)")
        
        // Deselect the row to provide visual feedback
        tableView.deselectRow(selectedRow)
    }
}
