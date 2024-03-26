//
//  FormView.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
//

import SwiftUI

struct FormView: View {
    
    enum LoanType {
        case annuity, amortis
    }
    
    @Binding var montant: Float
    @Binding var taux: Float
    @Binding var duree: Int
    @Binding var selectedPeriode: Loan.Periode
    @State private var selectedLoanType = LoanType.annuity
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Calculateur d'emprunt")
                    .font(.title)
                Spacer()
                Text("Type d'emprunt")
                    .font(.title3)
                Picker("Type d'emprunt", selection: $selectedLoanType) {
                    Text("Annuités constantes").tag(LoanType.annuity)
                    Text("Amortissements constants").tag(LoanType.amortis)
                }
                .pickerStyle(.palette)
                .padding(.bottom, 10)
                Divider()
                Text("Montant")
                    .font(.title3)
                TextField("Montant", value: $montant, formatter: NumberFormatter())
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                    .submitLabel(.done)
                Text("Taux d'intérêt")
                    .font(.title3)
                TextField("Taux", value: $taux, formatter: NumberFormatter())
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                    .submitLabel(.done)
                Text("Durée (années)")
                    .font(.title3)
                TextField("Durée", value: $duree, formatter: NumberFormatter())
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                    .submitLabel(.done)
                Picker("Période", selection: $selectedPeriode) {
                    Text("Mois").tag(Loan.Periode.mois)
                    Text("Trimestre").tag(Loan.Periode.trimestre)
                    Text("Semestre").tag(Loan.Periode.semestre)
                    Text("Année").tag(Loan.Periode.annee)
                }
                .pickerStyle(.palette)
                if selectedLoanType == LoanType.annuity {
                    NavigationLink(destination: AnnuityLoanTab(loan: AnnuityLoan(amount: montant, rate: taux, time: duree, periode: selectedPeriode))) {
                        Text("Valider")
                    }
                }
                else {
                    NavigationLink(destination: AmortisLoanTab(loan: AmortisLoan(amount: montant, rate: taux, time: duree, periode: selectedPeriode))) {
                        Text("Valider")
                    }
                }
                Spacer()
                
                
            }
            .padding()
        }
    }
}

#Preview {
    FormView(montant: .constant(10000), taux: .constant(5), duree: .constant(8), selectedPeriode: .constant(AnnuityLoan.Periode.annee))
}
