//
//  ViewController.swift
//  FootballSimulator
//
//  Created by Vladimir on 16.09.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewAlert: UIView!
    @IBOutlet weak var btnSimulate: UIButton!
    
    @IBAction func AddTeam(_ sender: Any) {
        
        if teams.count==8 {
            return
        }
        
        let alert = UIAlertController(title: "New team", message: "Enter new team this", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) -> Void in
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) -> Void in
            let textField = alert.textFields?[0]
            if let tf = textField {
                if let text = tf.text {
                    self.addRowTeam(rowTeam: text)
                }
            }
        }
        alert.addTextField { (_) -> Void in
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func simulate(_ sender: UIButton) {
        
//        for team in teams {
//            team.setToZero()
//        }
//
//        for i in 0..<teams.count {
//            for j in (i+1)..<teams.count {
//                
//                let teamScoreI = arc4random_uniform(10)
//                let teamScoreJ = arc4random_uniform(10)
//                teams[i].gamePlayed += 1
//                teams[j].gamePlayed += 1
//                
//                if teamScoreI < teamScoreJ {
//                    teams[i].gameLost += 1
//                    teams[j].gameWon += 1
//                    teams[j].points += 3
//                } else if teamScoreI > teamScoreJ {
//                    teams[i].gameWon += 1
//                    teams[j].gameLost += 1
//                    teams[i].points += 3
//                } else {
//                    teams[i].gameDrawn += 1
//                    teams[j].gameDrawn += 1
//                    teams[i].points += 1
//                    teams[j].points += 1
//                }
//                
////                print("\(teams[i].name) - \(teams[j].name) score \(teamScoreI)-\(teamScoreJ)")
//            }
//        }
//        
//        teams.sort {
//            if $0.points == $1.points {return $0.name < $1.name}
//            else {return $0.points > $1.points}
//        }
//        
//        for i in 0..<teams.count {
//            teams[i].position = i+1
//            print("\(teams[i].name) \(teams[i].gamePlayed) \(teams[i].gameWon) \(teams[i].gameDrawn) \(teams[i].gameLost) \(teams[i].points)")
//        }
//        
    }
    
    var teams = [Team]()
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultSegue" {
            let dvc = segue.destination as! RezultViewController
            dvc.teams = Team.simulate(teams: self.teams)
        }
    }
    
    func addRowTeam(rowTeam: String) {
        if rowTeam=="" {
            return
        }
        self.teams.append(Team(name: rowTeam))
        self.viewAlert.isHidden = true
        self.btnSimulate.isEnabled = teams.count>=4
        self.tableView.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAlert.isHidden = false
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.teams.append(Team(name: "1"))
        self.teams.append(Team(name: "2"))
        self.teams.append(Team(name: "3"))
        self.teams.append(Team(name: "4"))
        self.viewAlert.isHidden = true
        self.btnSimulate.isEnabled = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "\(teams[indexPath.row].name)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    
}

