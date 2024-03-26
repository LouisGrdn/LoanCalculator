//
//  LoanTab.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 24/03/2024.
//

import SwiftUI
import Foundation

struct AmortisLoanTab: View {
    let loan: AmortisLoan
    var body: some View {
        ScrollView(.horizontal) {
            ScrollView(.vertical) {
                Grid {
                    GridRow {
                        Text("Périodes")
                        Text("Capital")
                        Text("Intérêts")
                        Text("Amortissement")
                        Text("Annuité")
                        Text("Capital")
                    }
                    Divider()
                    ForEach(0..<loan.time, id: \.self) {index in
                        GridRow {
                            Text(String(index + 1))
                            Text(String((loan.getStartingCapital(periode: index) * 100).rounded() / 100))
                            Text(String((loan.getInterest(periode: index) * 100).rounded() / 100))
                            Text(String((loan.getAmortissement() * 100).rounded() / 100))
                            Text(String((loan.getAnnuity(periode: index) * 100).rounded() / 100))
                            Text(String((loan.getEndingCapital(periode: index) * 100).rounded() / 100))
                        }
                        Divider()
                    }
                }
            }
        }
    }
}

#Preview {
    AmortisLoanTab(loan: (AmortisLoan(amount: 10000, rate: 5, time: 8, periode: AnnuityLoan.Periode.annee)))
}
