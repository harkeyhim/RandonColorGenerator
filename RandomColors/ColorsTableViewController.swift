//
//  ColorsTableViewController.swift
//  RandomColors
//
//  Created by Yusuf Akeem on 03/04/2023.
//

import UIKit

class ColorsTableViewController: UIViewController {
  
    var colors: [UIColor] = []
    enum Cells {
        static let colorCell = "ColorCell"
    }
    enum Segues{
        static let toDetails = "ToColorsDetailsViewController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<100{
            colors.append(.random())
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailViewController
        destVC.color = sender as? UIColor
    }
}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetails, sender: color)
    }
}
