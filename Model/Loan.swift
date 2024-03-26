//
//  Loan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 26/03/2024.
//

import Foundation
class Loan {
    public enum Periode: String, CaseIterable {
        case mois, trimestre, semestre, annee
    }
    
    init(amount: Float, rate: Float, time: Int, periode: Periode) {
        self.amount = amount
        self.rate = rate / 100
        switch periode {
        case .mois:
            self.time = time * 12
        case .trimestre:
            self.time = time * 4
        case .semestre:
            self.time = time * 2
        case .annee:
            self.time = time
        }
    }
    
    var amount: Float = 0
    var rate: Float = 0
    var time: Int = 0
}
