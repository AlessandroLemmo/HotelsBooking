# HotelsBooking

L'applicazione realizzata è una Spring MVC Web Application, la quale permette ad un utente la prenotazione di una camera d'hotel tra quelli presenti nel database. Le funzionalità implementate per l'utente standard sono le seguenti:

- Possibilità di effettuare login e registrazione
- Aggiornamento credenziali di accesso
- Ricerca camera sulla base di vari parametri
- Possibilità di effettuare una prenotazione
- Modifica o cancellazione di una prenotazione

Si ha poi l'utente di tipo admin il quale ha funzionalità aggiuntive:
- Aggiunta, rimozione, modifica camere

## Requisiti
- Apache-Tomcat
- Spring MVC
- Maven
- MySQL


## Esecuzione
- setta le opzioni di connessione MySQL in src/main/resources/META-INF/config/jdbc.properties
- Crea e inizializza il database eseguendo lo script in files/hotel.sql
- Compila settando come goal di maven "package"
- Esporta il file war generato nella directory webapps nel percorso di installazione di apache-tomcat

## Note
- Inizialmente il database è popolato con due utenti, uno standard di tipo "user" e uno di tipo "admin" con rispettivamente le seguenti credenziali di accesso:
  - username: user, psw: user
  - username: admin, psw: admin
- Quando si effettua la registrazione l'utente è settato in automatico in modalità "user"
- Per poter effettuare una prenotazione di una camera è necessario prima aver effettuato il login altimenti è possibile solo visualizzare i dettagli di una camera
- Nel momento in cui si effettua il login vengono visualizzate le prenotazioni effettuate ed è possibile modificarle o cancellarle

Sono stati realizzati dei Mockup dell'applicazione tramite Balsamiq utili sia come guida per lo sviluppo che per farsi un'idea di come sarà l'interfaccia utente finale. Sono riportati nel seguente pdf: [Mockups.pdf](Mockups.pdf). Scaricandolo è possibile navigare tra le varie viste.

La relazione del progetto è in [report.pdf](report.pdf).

### Screenshot dell'applicazione
![Cattura1](https://user-images.githubusercontent.com/47114787/124766900-9e7b2d00-df37-11eb-939e-af0177f76d90.JPG)

![Cattura2](https://user-images.githubusercontent.com/47114787/124766931-a4710e00-df37-11eb-9566-e229b13eddc3.JPG)



