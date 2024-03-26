//
//  LoanTab.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 24/03/2024.
//

import SwiftUI
import Foundation

struct AnnuityLoanTab: View {
    let loan: AnnuityLoan
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
                            Text(String((loan.getAmortissement(periode: index) * 100).rounded() / 100))
                            Text(String((loan.annuity() * 100).rounded() / 100))
                            Text(String((loan.getEndingCapital(periode: index) * 100).rounded() / 100))
                        }
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    AnnuityLoanTab(loan: (AnnuityLoan(amount: 10000, rate: 5, time: 8, periode: AnnuityLoan.Periode.semestre)))
}
