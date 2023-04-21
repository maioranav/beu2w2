# API REST per Device e Employee

Questa è una API REST per gestire i device e gli employee di un'azienda.

## Autenticazione

L'autenticazione avviene mediante username e password e si effettua tramite l'endpoint:

`POST /api/login`

I dati devono essere inviati come oggetto JSON con i seguenti campi:

- `username`: stringa (obbligatorio)
- `password`: stringa (obbligatorio)

Se l'autenticazione avviene con successo, verrà restituito un token che dovrà essere utilizzato in tutti gli altri endpoint.

## Registrazione

Gli utenti possono registrarsi tramite l'endpoint:

`POST /api/register`

I dati devono essere inviati come oggetto JSON con i seguenti campi:

- `name`: stringa (opzionale)
- `username`: stringa (obbligatorio)
- `email`: stringa (obbligatorio)
- `password`: stringa (obbligatorio)

Il ruolo dell'utente registrato sarà di default `USER`.

## Endpoints

### Device

#### GET /api/device

Restituisce la lista di tutti i device.

#### GET /api/device/{id}

Restituisce le informazioni sul device specificato dall'ID.

#### GET /api/device/status/{status}

Restituisce la lista di tutti i device con lo stato specificato (`AVAILABLE`, `ASSIGNED`, `MAINTENANCE`, `OUTOFORDER`).

#### GET /api/device/status/{status}/{type}

Restituisce la lista di tutti i device con lo stato e il tipo specificati (`SMARTPHONE`, `TABLET`, `LAPTOP`).

#### POST /api/device

Crea un nuovo device.

#### PUT /api/device/{id}

Aggiorna le informazioni sul device specificato dall'ID. Accetta un oggetto JSON con i seguenti campi:

- `status`: stringa (`AVAILABLE`, `ASSIGNED`, `MAINTENANCE`, `OUTOFORDER`)
- `type`: stringa (`SMARTPHONE`, `TABLET`, `LAPTOP`)
- `employee`: oggetto JSON che rappresenta l'employee assegnato al device (opzionale)

Se lo stato è `ASSIGNED`, l'employee specificato verrà assegnato al device.

#### DELETE /api/device/{id}

Cancella il device specificato dall'ID.

### Employee

#### GET /api/employee

Restituisce la lista di tutti gli employee.

#### GET /api/employee/{username}

Restituisce le informazioni sull'employee specificato dall'username.

#### POST /api/employee

Crea un nuovo employee.

#### PUT /api/employee/{username}

Aggiorna le informazioni sull'employee specificato dall'username. Accetta un oggetto JSON con i seguenti campi:

- `username`: stringa
- `firstname`: stringa
- `lastname`: stringa
- `email`: stringa

#### DELETE /api/employee/{username}

Cancella l'employee specificato dall'username. Funziona solo se l'employee non ha device assegnati.

## Autorizzazioni

- Gli utenti `USER` possono accedere solo ed esclusivamente a `/api/device/status/AVAILABLE`.
- Gli utenti `ADMIN` possono accedere a tutti gli endpoint.
