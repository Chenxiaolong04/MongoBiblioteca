# Documentazione Base Database Biblioteca MongoDB

## 1. Scopo del progetto
Questo progetto definisce una base dati MongoDB per una applicazione di gestione di una biblioteca. Contiene dati su utenti, libri e prestiti.

---

## 2. Struttura del Database

Il database si chiama **`biblioteca`** e contiene tre collezioni principali:

### 2.1 Collezione `utenti`
Memorizza i dati degli utenti iscritti alla biblioteca.

**Campi principali:**

| Campo       | Tipo     | Descrizione                     |
|-------------|----------|---------------------------------|
| `_id`       | Stringa  | Identificativo univoco utente   |
| `nome`      | Stringa  | Nome utente                     |
| `cognome`   | Stringa  | Cognome utente                  |
| `email`     | Stringa  | Email di contatto               |
| `telefono`  | Stringa  | Numero di telefono              |
| `indirizzo` | Stringa  | Indirizzo di residenza          |
| `iscrizione`| Data     | Data di iscrizione (YYYY-MM-DD) |

---

### 2.2 Collezione `libri`
Contiene le informazioni sui libri presenti in biblioteca.

**Campi principali:**

| Campo     | Tipo    | Descrizione                       |
|-----------|---------|-----------------------------------|
| `_id`     | Stringa | Identificativo univoco libro      |
| `titolo`  | Stringa | Titolo del libro                  |
| `anno`    | Numero  | Anno di pubblicazione             |
| `autore`  | Stringa | Nome autore                       |
| `genere`  | Stringa | Genere letterario                 |
| `copie`   | Numero  | Numero copie disponibili          |

---

### 2.3 Collezione `prestiti`
Registra i prestiti dei libri da parte degli utenti.

**Campi principali:**

| Campo           | Tipo    | Descrizione                              |
|-----------------|---------|------------------------------------------|
| `_id`           | Stringa | Identificativo univoco prestito          |
| `id_utente`     | Stringa | Riferimento all'utente (_id in `utenti`) |
| `id_libro`      | Stringa | Riferimento al libro (_id in `libri`)    |
| `data_prestito` | Data    | Data di inizio prestito (YYYY-MM-DD)     |
| `data_restituzione`| Data o null | Data di restituzione (null se non restituito)|

---

## 3. Come importare i dati

### 3.1 Pre-requisiti
- MongoDB installato e in esecuzione.
- Strumenti `mongoimport` e `mongosh` disponibili nel PATH.
- I file JSON (`utenti.json`, `libri.json`, `prestiti.json`) nella cartella dataset_biblioteca.

### 3.2 Comandi di importazione con `mongoimport`

```bash

mongosh <<EOF
use biblioteca
db.utenti.insertMany($(cat dataset_biblioteca/utenti.json))
db.libri.insertMany($(cat dataset_biblioteca/libri.json))
db.prestiti.insertMany($(cat dataset_biblioteca/prestiti.json))
EOF

echo "Importazione completata con mongosh."
