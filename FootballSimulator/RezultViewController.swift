//
//  RezultViewController.swift
//  FootballSimulator
//
//  Created by Vladimir on 24.09.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class RezultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var teams = [Team]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rezultCell") as! RezultTableViewCell
        let team = teams[indexPath.row]
        cell.number.text = "\(team.position)"
        cell.name.text = team.name
        cell.played.text = "\(team.gamePlayed)"
        cell.won.text = "\(team.gameWon)"
        cell.drawn.text = "\(team.gameDrawn)"
        cell.lost.text = "\(team.gameLost)"
        cell.pts.text = "\(team.points)"
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
