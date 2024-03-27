//
//  AmortisRow.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 27/03/2024.
//

import SwiftUI

struct AmortisRow: View {
    let index: Int
    let loan: AmortisLoan
    var body: some View {
        GridRow {
            Text(String(index + 1))
            Text(String((loan.getStartingCapital(periode: index) * 100).rounded() / 100))
            Text(String((loan.getInterest(periode: index) * 100).rounded() / 100))
            Text(String((loan.getAmortissement() * 100).rounded() / 100))
            Text(String((loan.getAnnuity(periode: index) * 100).rounded() / 100))
            Text(String((loan.getEndingCapital(periode: index) * 100).rounded() / 100))
        }
    }
}
