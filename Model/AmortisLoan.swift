//
//  AmortisLoan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 26/03/2024.
//

import Foundation

class AmortisLoan: Loan {
    
    func getAnnuity(periode: Int) -> Float {
        return getInterest(periode: periode) + getAmortissement()
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
    
    func getAmortissement() -> Float {
        return self.amount / Float(self.time)
    }
    
    func getEndingCapital(periode: Int) -> Float {
        let calcul = getStartingCapital(periode: periode) - getAmortissement()
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
