//
//  Loan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
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
    
    func annuity() -> Float {
        return self.amount * (self.rate / (1 - pow(1 + self.rate, Float(self.time * -1))))
    }
    
    func getStartingCapital(periode: Int) -> Float {
        var result = self.amount
//            for _ in 0..<periode {
//                print(result)
//                result = result - annuity() - result * self.rate
//            }
        if periode > 0 {
            result = getEndingCapital(periode: periode - 1)
        }
        return result
    }
    
    func getInterest(periode: Int) -> Float {
        return getStartingCapital(periode: periode) * self.rate
    }
    
    func getAmortissement(periode: Int) -> Float {
        return annuity() - getInterest(periode: periode)
    }
    
    func getEndingCapital(periode: Int) -> Float {
        let calcul = getStartingCapital(periode: periode) - getAmortissement(periode: periode)
        return  calcul < 0 ? calcul * -1 : calcul
    }
}
