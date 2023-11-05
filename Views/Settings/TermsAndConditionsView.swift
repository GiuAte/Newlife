//
//  TermsOfServiceView.swift
//  Newlife
//
//  Created by Giulio Aterno on 05/11/23.
//

import SwiftUI
import MessageUI

struct TermsAndConditionsView: View {
    
    @State private var isMailViewPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.whiteBackground.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Scaricando o utilizzando l'app, questi termini si applicheranno automaticamente a te - assicurati quindi di leggerli attentamente prima di utilizzare l'app. Non ti è consentito copiare o modificare l'app, alcuna parte dell'app o i nostri marchi in alcun modo. Non ti è consentito tentare di estrarre il codice sorgente dell'app, e non dovresti neanche cercare di tradurre l'app in altre lingue o crearne versioni derivate. L'app stessa e tutti i marchi, diritti d'autore, diritti sul database e altri diritti di proprietà intellettuale ad esso correlati, appartengono ancora a Giulio Aterno.")
                    
                    Text("Giulio Aterno si impegna a garantire che l'app sia il più utile ed efficiente possibile. Per questo motivo, ci riserviamo il diritto di apportare modifiche all'app o di addebitare per i suoi servizi, in qualsiasi momento e per qualsiasi motivo. Non ti addebiteremo mai per l'app o i suoi servizi senza farti capire esattamente cosa stai pagando.")
                    
                    Text("L'app Newlife memorizza e elabora dati personali che ci hai fornito, per fornire il nostro Servizio. È tua responsabilità mantenere sicuro il tuo telefono e l'accesso all'app. Raccomandiamo quindi di non effettuare il jailbreak o il root del telefono, che è il processo di rimozione delle restrizioni e dei limiti software imposti dal sistema operativo ufficiale del tuo dispositivo. Ciò potrebbe rendere il tuo telefono vulnerabile a malware/virus/programmi dannosi, compromettere le funzionalità di sicurezza del tuo telefono e potrebbe significare che l'app Newlife non funzionerà correttamente o affatto.")
                    
                    Text("L'app utilizza servizi di terze parti che dichiarano i loro Termini e Condizioni.")
                    
                    Text("Dovresti essere consapevole del fatto che ci sono alcune cose di cui Giulio Aterno non si assumerà la responsabilità. Alcune funzioni dell'app richiederanno che l'app abbia una connessione internet attiva. La connessione può essere Wi-Fi o fornita dal tuo operatore di rete mobile, ma Giulio Aterno non può assumersi la responsabilità del fatto che l'app non funzioni a piena funzionalità se non hai accesso al Wi-Fi e non hai più alcuna quantità di dati disponibili.")
                    
                    Text("Se stai utilizzando l'app al di fuori di un'area con Wi-Fi, dovresti ricordare che i termini dell'accordo con il tuo operatore di rete mobile saranno comunque applicati. Di conseguenza, potresti essere addebitato dal tuo operatore di telefonia mobile per il costo dei dati durante la connessione all'app, o per altri addebiti di terze parti. Utilizzando l'app, accetti la responsabilità di tali addebiti, compresi i costi di roaming dati se utilizzi l'app al di fuori del tuo territorio di residenza (cioè regione o paese) senza disattivare il roaming dati. Se tu non sei il pagante del conto per il dispositivo su cui stai utilizzando l'app, sappi che assumiamo che tu abbia ricevuto il permesso dal pagante per utilizzare l'app.")
                    
                    Text("Sullo stesso argomento, Giulio Aterno non può sempre assumersi la responsabilità del modo in cui utilizzi l'app, ovvero devi assicurarti che il tuo dispositivo rimanga carico - se si esaurisce la batteria e non puoi accenderlo per usufruire del Servizio, Giulio Aterno non può accettare responsabilità.")
                    
                    Text("Per quanto riguarda la responsabilità di Giulio Aterno per l'uso dell'app da parte tua, è importante tenere presente che, sebbene ci sforziamo di garantire che sia sempre aggiornata e corretta, ci affidiamo a terze parti per fornirci le informazioni in modo da renderle disponibili a te. Giulio Aterno declina qualsiasi responsabilità per qualsiasi perdita, diretta o indiretta, che tu subisca a seguito della completa affidabilità di questa funzionalità dell'app.")
                    
                    Text("In futuro, potremmo desiderare di aggiornare l'app. Attualmente, l'app è disponibile su iOS - i requisiti per il sistema (e per eventuali altri sistemi a cui decidiamo di estendere la disponibilità dell'app) possono cambiare, e dovrai scaricare gli aggiornamenti se desideri continuare a utilizzare l'app. Giulio Aterno non promette di aggiornare sempre l'app in modo che sia pertinente per te e/o funzioni con la versione di iOS che hai installato sul tuo dispositivo. Tuttavia, prometti di accettare sempre gli aggiornamenti dell'app quando ti vengono offerti. Potremmo anche desiderare di interrompere la fornitura dell'app e di porre termine all'uso di essa in qualsiasi momento, senza preavviso di cessazione a te. A meno che non ti diciamo diversamente, alla cessazione di qualsiasi termine, (a) i diritti e le licenze concessi a te in questi termini termineranno; (b) dovrai smettere di utilizzare l'app e (se necessario) eliminarla dal tuo dispositivo.")
                    
                    Text("Modifiche a questi Termini e Condizioni")
                        .font(.title)
                        .bold()
                    
                    Text("Potremmo aggiornare i nostri Termini e Condizioni di volta in volta. Pertanto, ti consigliamo di rivedere questa pagina periodicamente per eventuali modifiche. Ti informeremo di eventuali modifiche pubblicando i nuovi Termini e Condizioni su questa pagina.")
                    
                    Text("Questi Termini e Condizioni sono efficaci dal 2023-11-05.")
                    
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
                .navigationTitle("Termini e Condizioni")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}

#Preview {
    TermsAndConditionsView()
}
