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

### Employee

#### GET /api/employee

Restituisce la lista di tutti gli employee.

#### GET /api/employee/{username}

Restituisce le informazioni sull'employee specificato dall'username.

## Autorizzazioni

- Gli utenti `USER` possono accedere solo ed esclusivamente a `/api/device/status/AVAILABLE`.
- Gli utenti `ADMIN` possono accedere a tutti gli endpoint.
