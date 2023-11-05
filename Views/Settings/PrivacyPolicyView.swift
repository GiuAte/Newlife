//
//  PrivacyPolicyView.swift
//  Newlife
//
//  Created by Giulio Aterno on 05/11/23.
//

import SwiftUI
import MessageUI

struct PrivacyPolicyView: View {
    
    @State private var isMailViewPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.whiteBackground.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Giulio Aterno ha sviluppato l'app Newlife come un'applicazione commerciale. Questo servizio è fornito da NewsAPI, un servizio hosting di news gratuite ed è destinato all'uso come tale.")
                    
                    
                    Text("Questa pagina è utilizzata per informare i visitatori riguardo alle nostre politiche in merito alla raccolta, all'uso e alla divulgazione delle informazioni personali nel caso in cui qualcuno decida di utilizzare il nostro Servizio.")
                    
                    Text("Per offrire un'esperienza migliore durante l'utilizzo del nostro Servizio, potremmo richiederti di fornirci determinate informazioni personali, come ad esempio la tua posizione. Le informazioni che richiediamo verranno conservate da noi e utilizzate come descritto in questa politica sulla privacy.")
                    
                    Text("L'app utilizza servizi di terze parti che potrebbero raccogliere informazioni utilizzate alla localizzazione.")
                    
                    Text("Fornitori di servizi")
                        .font(.title)
                        .bold()
                    
                    Text("Potremmo avvalerci di società e individui di terze parti per le seguenti ragioni:")
                    Text("• Per agevolare il nostro Servizio;")
                    Text("• Per fornire il Servizio per nostro conto;")
                    Text("• Per svolgere servizi correlati al Servizio; o")
                    Text("• Per aiutarci ad analizzare come viene utilizzato il nostro Servizio.")
                    
                    Text("Desideriamo informare gli utenti di questo Servizio che queste terze parti hanno accesso alle loro informazioni personali. La ragione è quella di svolgere i compiti loro assegnati per nostro conto. Tuttavia, sono obbligati a non divulgare o utilizzare le informazioni per scopi diversi.")
                    
                    Text("Sicurezza")
                        .font(.title)
                        .bold()
                    
                    Text("Apprezziamo la tua fiducia nel fornirci le tue informazioni personali e pertanto cerchiamo di utilizzare mezzi commercialmente accettabili per proteggerle. Tuttavia, ricorda che nessun metodo di trasmissione su Internet o di conservazione elettronica è al 100% sicuro e affidabile, e non possiamo garantirne la sicurezza assoluta.")
                    
                    Text("Collegamenti ad altri siti")
                        .font(.title)
                        .bold()
                    
                    Text("Questo Servizio potrebbe contenere collegamenti ad altri siti. Se fai clic su un collegamento di terze parti, sarai indirizzato a quel sito. Tieni presente che questi siti esterni non sono gestiti da noi. Pertanto, ti consigliamo vivamente di esaminare l'Informativa sulla privacy di questi siti web. Non abbiamo alcun controllo e non assumiamo alcuna responsabilità per i contenuti, le politiche sulla privacy o le pratiche di qualsiasi sito o servizio di terze parti.")
                    
                    Text("Modifiche a questa Informativa sulla privacy")
                        .font(.title)
                        .bold()
                    
                    Text("Potremmo aggiornare periodicamente la nostra Informativa sulla privacy. Pertanto, ti consigliamo di rivedere questa pagina periodicamente per eventuali modifiche. Ti informeremo di eventuali modifiche pubblicando la nuova Informativa sulla privacy su questa pagina.")
                    
                    Text("Questa politica è efficace dal 5 novembre 2023.")
                    
                    Text("Contattaci")
                        .font(.title)
                        .bold()
                    
                    Text("Se hai domande o suggerimenti riguardo alla nostra Informativa sulla privacy, non esitare a contattarci all'indirizzo")
                    Text("giulioaternodev@gmail.com")
                        .sheet(isPresented: $isMailViewPresented) {
                            MailComposeView(emailAddress: "giulioaternodev@gmail.com")
                        }
                }
                .padding()
                .navigationTitle("Informativa")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}


#Preview {
    PrivacyPolicyView()
}

