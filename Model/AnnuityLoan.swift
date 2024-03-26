//
//  Loan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
//

import Foundation

class AnnuityLoan: Loan {
    
    func annuity() -> Float {
        return self.amount * (self.rate / (1 - pow(1 + self.rate, Float(self.time * -1))))
    }
    
    func getStartingCapital(periode: Int) -> Float {
        var result = self.amount
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
//        return calcul
        switch(true) {
        case calcul < 0:
            return calcul * -1
        case calcul < 1:
            return 0
        default:
            return calcul
        }
    }
}
