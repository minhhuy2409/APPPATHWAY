//
//  MockData.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

struct MockData {
    
    static var coach = Coach(
        name: "Coach Prime",
        teamName: "CTRL11 FC",
        email: "coach@ctrl11.com",
        phoneNumber: "0912345678",
        favoriteFormation: .f433_Holding,
        experience: "15 years, UEFA A License",
        imageData: nil,
        avatarSystemIcon: "person.crop.circle.fill",
        wins: 45,
        draws: 12,
        losses: 8
    )
    
    static var players = [
        Player(name: "HUYBIN", position: "CM", height: 178, weight: 72, skills: ["Pace": 3, "Shooting": 4, "Passing": 5, "Dribbling": 4, "Defending": 2, "Physical": 3]),
        Player(name: "BRUNO", position: "CAM", height: 179, weight: 70, skills: ["Pace": 4, "Shooting": 4, "Passing": 5, "Dribbling": 4, "Defending": 3, "Physical": 3]),
    ]
    
    static var trainingItems: [TrainingItem] = [
        // ATTACK
        TrainingItem(id: UUID(), name: "3v2 Overload", category: .attack, playersNeeded: "5 Players + GK", time: "15 mins", description: "3 attackers against 2 defenders, focusing on quick passes and finishing."),
        TrainingItem(id: UUID(), name: "Finishing from Crosses", category: .attack, playersNeeded: "6+ Players", time: "20 mins", description: "Practice finishing from wide crosses. Divide into crossers and finishers."),
        TrainingItem(id: UUID(), name: "Through Ball Timing", category: .attack, playersNeeded: "4 Players + GK", time: "15 mins", description: "Two midfielders play through balls for a striker to run onto and finish."),
        
        // DEFENSE
        TrainingItem(id: UUID(), name: "1v1 Defending", category: .defend, playersNeeded: "2+ Players", time: "10 mins", description: "Defender practices jockeying, forcing the attacker wide and preventing them from getting past."),
        TrainingItem(id: UUID(), name: "Back Line Shift", category: .defend, playersNeeded: "4 Players", time: "15 mins", description: "A back four line moves in unison as the ball is shifted from side to side."),
        TrainingItem(id: UUID(), name: "Clearance & Recovery", category: .defend, playersNeeded: "4+ Players", time: "15 mins", description: "Defenders practice clearing the ball under pressure and then quickly recovering their defensive positions."),
        
        // CONTROL
        TrainingItem(id: UUID(), name: "Rondo (5v2)", category: .control, playersNeeded: "7 Players", time: "10 mins", description: "A group of 5 players tries to keep possession while 2 players in the middle try to win it back."),
        TrainingItem(id: UUID(), name: "First Touch Drill", category: .control, playersNeeded: "2+ Players", time: "10 mins", description: "Player receives a pass, controls it with their first touch, and passes it back."),
        TrainingItem(id: UUID(), name: "Turning Under Pressure", category: .control, playersNeeded: "2 Players", time: "10 mins", description: "Player receives the ball with their back to a defender and must turn to create space."),

        // PHYSICAL
        TrainingItem(id: UUID(), name: "Shuttle Runs", category: .physical, playersNeeded: "1+ Players", time: "10 mins", description: "Short, intense sprints with changes of direction to build stamina and agility."),
        TrainingItem(id: UUID(), name: "Agility Ladder", category: .physical, playersNeeded: "1+ Players", time: "10 mins", description: "Perform various footwork drills through an agility ladder to improve coordination and speed.")
    ]

    static func getFormationPositions(for formation: Formation) -> [PlayerPosition] {
        let positions: [CGPoint]
        switch formation {
        case .f433_Holding, .f433_False9, .f343:
            positions = [
                CGPoint(x: 0.5, y: 0.9),
                CGPoint(x: 0.2, y: 0.75), CGPoint(x: 0.4, y: 0.78), CGPoint(x: 0.6, y: 0.78), CGPoint(x: 0.8, y: 0.75),
                CGPoint(x: 0.3, y: 0.5),  CGPoint(x: 0.5, y: 0.55), CGPoint(x: 0.7, y: 0.5),
                CGPoint(x: 0.2, y: 0.25), CGPoint(x: 0.5, y: 0.2),  CGPoint(x: 0.8, y: 0.25)
            ]
        case .f532, .f541:
            positions = [
                CGPoint(x: 0.5, y: 0.9),
                CGPoint(x: 0.1, y: 0.75), CGPoint(x: 0.3, y: 0.8), CGPoint(x: 0.5, y: 0.8), CGPoint(x: 0.7, y: 0.8), CGPoint(x: 0.9, y: 0.75),
                CGPoint(x: 0.3, y: 0.5), CGPoint(x: 0.5, y: 0.45), CGPoint(x: 0.7, y: 0.5),
                CGPoint(x: 0.4, y: 0.2), CGPoint(x: 0.6, y: 0.2)
            ]
        default:
            positions = [
                CGPoint(x: 0.5, y: 0.9),
                CGPoint(x: 0.2, y: 0.75), CGPoint(x: 0.4, y: 0.78), CGPoint(x: 0.6, y: 0.78), CGPoint(x: 0.8, y: 0.75),
                CGPoint(x: 0.15, y: 0.5), CGPoint(x: 0.4, y: 0.5),  CGPoint(x: 0.6, y: 0.5),  CGPoint(x: 0.85, y: 0.5),
                CGPoint(x: 0.4, y: 0.25), CGPoint(x: 0.6, y: 0.25)
            ]
        }
        return positions.indices.map { PlayerPosition(number: $0 + 1, position: positions[$0]) }
    }
}
