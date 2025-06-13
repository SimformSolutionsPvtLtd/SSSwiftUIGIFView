//
//  NavoViewController.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 18/04/25.
//

#if os(iOS)
import Foundation
import UIKit
class DemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let gifURLs: [String] = [
            "https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
                    "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
                    "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
                    "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
                    "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
            "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
            "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
            "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
            "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
            "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
            "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
            "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
            "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
            "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"            ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifURLs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let gifName = gifURLs[indexPath.row]
           cell.configure(gifName: gifName)

        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a styled back button
        let backButton = UIButton(type: .system)
        
        // Configure back button with icon and text
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        let chevronImage = UIImage(systemName: "chevron.left", withConfiguration: config)
        backButton.setImage(chevronImage, for: .normal)
        backButton.setTitle(" Back", for: .normal)
        backButton.tintColor = .systemBlue
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        // Add button target
        backButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        
        // Create a container view for the button with proper layout
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        headerView.backgroundColor = .systemBackground
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure button size and position
        backButton.frame = CGRect(x: 16, y: 16, width: 100, height: 30)
        headerView.addSubview(backButton)
        view.addSubview(headerView)
        
        // Set up header view constraints
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Make sure tableView is set for Auto Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
//        // Add a subtle separator line
//        let separator = UIView(frame: CGRect(x: 0, y: headerView.frame.maxY - 1, width: view.bounds.width, height: 1))
//        separator.backgroundColor = UIColor.systemGray5
//        view.addSubview(separator)
//        
        // Adjust tableView's frame to start below the header using autolayout
        view.addConstraints([
            NSLayoutConstraint(item: tableView!, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        ])
        
        // Table view setup
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set title for this screen
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 16, width: view.bounds.width, height: 30))
        titleLabel.text = "UIKit GIF Examples"
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textAlignment = .center
        headerView.addSubview(titleLabel)
    }
    
    @objc private func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
}
#endif
