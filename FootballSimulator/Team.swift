//
//  Team.swift
//  FootballSimulator
//
//  Created by Vladimir on 23.09.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

class Team {
    
    let name : String
    var position : Int = 0
    var gamePlayed : Int = 0
    var gameWon : Int = 0
    var gameDrawn : Int = 0
    var gameLost : Int = 0
    var points : Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func setToZero() {
        self.position = 0
        self.gamePlayed = 0
        self.gameWon = 0
        self.gameDrawn = 0
        self.gameLost = 0
        self.points = 0
    }
    
    static func simulate(teams: [Team]) -> [Team] {
        
        for team in teams {
            team.setToZero()
        }
        
        for i in 0..<teams.count {
            for j in (i+1)..<teams.count {
                
                let teamScoreI = arc4random_uniform(10)
                let teamScoreJ = arc4random_uniform(10)
                teams[i].gamePlayed += 1
                teams[j].gamePlayed += 1
                
                if teamScoreI < teamScoreJ {
                    teams[i].gameLost += 1
                    teams[j].gameWon += 1
                    teams[j].points += 3
                } else if teamScoreI > teamScoreJ {
                    teams[i].gameWon += 1
                    teams[j].gameLost += 1
                    teams[i].points += 3
                } else {
                    teams[i].gameDrawn += 1
                    teams[j].gameDrawn += 1
                    teams[i].points += 1
                    teams[j].points += 1
                }
                
                //                print("\(teams[i].name) - \(teams[j].name) score \(teamScoreI)-\(teamScoreJ)")
            }
        }
        
        var rezult = teams.sorted {
            if $0.points == $1.points {return $0.name < $1.name}
            else {return $0.points > $1.points}
        }
        
//        print("")
        for i in 0..<rezult.count {
            rezult[i].position = i+1
//            print("\(rezult[i].position) \(rezult[i].name) \(rezult[i].gamePlayed) \(rezult[i].gameWon) \(rezult[i].gameDrawn) \(rezult[i].gameLost) \(rezult[i].points)")
        }
        
        return rezult
    }
    
}
