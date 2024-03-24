//
//  LoanTab.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 24/03/2024.
//

import SwiftUI
import Foundation

struct LoanTab: View {
    @Binding var loan: Loan
    var body: some View {
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
                let amount = loan.amount - ((loan.annuity() - loan.amount * loan.rate) * Float(index))
                GridRow {
                    Text(String(index + 1))
                    Text(String(amount))
                    Text(String(amount * loan.rate))
                    Text(String(loan.annuity() - amount * loan.rate))
                    Text(String(loan.annuity()))
                    Text(String(amount - (loan.annuity() - amount * loan.rate)))
                }
            }
        }
    }
}

#Preview {
    LoanTab(loan: .constant(Loan(amount: 10000, rate: 5, time: 8, periode: Loan.Periode.annee)))
}
