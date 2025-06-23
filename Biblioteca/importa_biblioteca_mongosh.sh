#!/bin/bash

echo "Importazione dati nel database MongoDB 'biblioteca' tramite mongosh..."

mongosh <<EOF
use biblioteca
db.utenti.insertMany($(cat dataset_biblioteca/utenti.json))
db.libri.insertMany($(cat dataset_biblioteca/libri.json))
db.prestiti.insertMany($(cat dataset_biblioteca/prestiti.json))
EOF

echo "Importazione completata con mongosh."
