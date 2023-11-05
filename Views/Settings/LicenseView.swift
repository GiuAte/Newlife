//
//  LicenseView.swift
//  Newlife
//
//  Created by Giulio Aterno on 05/11/23.
//

import Foundation
import SwiftUI

struct LicenseView: View {
    
    @State private var isMailViewPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.whiteBackground.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Questo Contratto di Licenza per l'Utente Finale (EULA) è un accordo legale tra te e Newlife Inc. Il nostro EULA è stato creato utilizzando il Modello EULA per Newlife.")
                    
                    Text("Questo accordo EULA disciplina il download e l'uso del nostro software Newlife (Software) direttamente fornito da Giulio Aterno e l'AppStore di Apple.")
                    
                    Text("Si prega di leggere attentamente questo accordo EULA prima di completare il processo di installazione e utilizzare il software Newlife. Esso fornisce una licenza per utilizzare il software Newlife e contiene informazioni sulla garanzia e dichiarazioni di esclusione di responsabilità.")
                    
                    Text("Installando e/o utilizzando il software Newlife, confermi la tua accettazione del Software e l'accettazione dei termini di questo accordo EULA.")
                    
                    Text("Se stai entrando in questo accordo EULA per conto di un'azienda o di un'altra entità legale, dichiari di avere l'autorità per vincolare tale entità e le sue affiliate a questi termini e condizioni. Se non hai tale autorità o se non sei d'accordo con i termini e le condizioni di questo accordo EULA, non installare o utilizzare il Software, e non devi accettare questo accordo EULA.")
                    
                    Text("Questo accordo EULA si applica solo al Software fornito da Giulio Aterno. a prescindere dal fatto che si faccia riferimento o meno ad altri software in questo documento. I termini si applicano anche a qualsiasi aggiornamento, supplemento, servizi basati su Internet e servizi di supporto forniti da Giulio Aterno per il Software, a meno che altri termini li accompagnino alla consegna. In tal caso, tali termini si applicano.")
                    
                    Text("Concessione della Licenza")
                        .font(.title)
                        .bold()
                    
                    Text("Hai il permesso di caricare il software Newlife (ad esempio su PC, laptop, dispositivi mobili o tablet) sotto il tuo controllo. Sei responsabile di assicurarti che il tuo dispositivo soddisfi i requisiti minimi del software Newlife.")
                    
                    Text("Non ti è consentito:")
                    Text("• Modificare, alterare, modificare, adattare, tradurre o cambiare in altro modo l'intero o parte del Software, né consentire all'intero o a parte del Software di essere combinato con o incorporato in altro software, né decompilare, disassemblare o tentare di effettuare ingegneria inversa del Software o di fare tentativi in tal senso.")
                    Text("• Riprodurre, copiare, distribuire, rivendere o utilizzare in altro modo il Software a scopo commerciale.")
                    Text("• Consentire a terzi di utilizzare il Software per conto o a beneficio di terzi.")
                    Text("• Utilizzare il Software in modo che violi qualsiasi legge locale, nazionale o internazionale applicabile.")
                    Text("• Utilizzare il Software a scopi che Newlife considera essere una violazione di questo accordo EULA.")
                    
                    Text("Proprietà Intellettuale e Proprietà")
                        .font(.title)
                        .bold()
                    
                    Text("Newlife manterrà sempre la proprietà del Software come originariamente scaricato da te e di tutti i download successivi del Software da te. Il Software (e il copyright e altri diritti di proprietà intellettuale di qualsiasi natura nel Software, comprese eventuali modifiche apportate allo stesso) sono e rimarranno di proprietà di Giulio Aterno.")
                    
                    Text("Newlife si riserva il diritto di concedere licenze per l'uso del Software a terze parti.")
                    
                    Text("Risoluzione")
                        .font(.title)
                        .bold()
                    
                    Text("Questo accordo EULA è efficace dalla data del primo utilizzo del Software e proseguirà fino a quando verrà terminato. Puoi terminarlo in qualsiasi momento mediante comunicazione scritta a Newlife.")
                    
                    Text("Esso terminerà anche immediatamente se non rispetti uno qualsiasi dei termini di questo accordo EULA. In caso di tale terminazione, le licenze concesse da questo accordo EULA termineranno immediatamente e accetti di interrompere tutto l'accesso e l'uso del Software. Le disposizioni che, per loro natura, continuano e sopravvivono sopravviveranno a qualsiasi risoluzione di questo accordo EULA.")
                    
                    Text("Legge Applicabile")
                        .font(.title)
                        .bold()
                    
                    Text("Questo accordo EULA e qualsiasi controversia derivante o in relazione a questo accordo EULA saranno disciplinati e interpretati in conformità alle leggi dell'id.")
                    
                    Text("Contattaci")
                        .font(.title)
                        .bold()
                    
                    Text("Se hai domande o suggerimenti sui nostri Termini e Condizioni, non esitare a contattarci all'indirizzo")
                    Text("giulioaternodev@gmail.com")
                        .sheet(isPresented: $isMailViewPresented) {
                            MailComposeView(emailAddress: "giulioaternodev@gmail.com")
                        }
                }
                .padding()
                .navigationTitle("Licenza")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}

#Preview {
    LicenseView()
}
