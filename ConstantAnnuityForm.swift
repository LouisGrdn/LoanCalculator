//
//  ConstantAnnuity.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
//

import SwiftUI

struct ConstantAnnuityForm: View {
    @Binding var montant: Float
    @Binding var taux: Float
    @Binding var duree: Int
    @Binding var selectedPeriode: Loan.Periode
    var body: some View {
        VStack {
            Text("Calculateur d'emprunt")
                .font(.title)
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
            
            
        }
        .padding()
    }
}

#Preview {
    ConstantAnnuityForm(montant: .constant(10), taux: .constant(10), duree: .constant(5), selectedPeriode: .constant(Loan.Periode.annee))
}
