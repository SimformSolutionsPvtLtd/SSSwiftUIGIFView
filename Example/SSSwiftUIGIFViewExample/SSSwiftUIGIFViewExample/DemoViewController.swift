//
//  NavoViewController.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 18/04/25.
//
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
    
    @IBOutlet weak var tblNavoContent: UITableView!
    
    
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
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        backButton.frame = CGRect(x: 20, y: 50, width: 100, height: 40) // Adjust as needed
        view.addSubview(backButton)
        tblNavoContent.delegate = self
        tblNavoContent.dataSource = self
    }
    
    @objc private func dismissSelf() {
            self.dismiss(animated: true, completion: nil)
        }
}
