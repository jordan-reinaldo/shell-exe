#!/bin/bash

cd /home/shell-exe/Job09
# Set -x permet de check
set -x

#variable dossier csv
csv_file="Shell_Userlist.csv"

while IFS=',' read -r Id Prenom Nom Mdp Role; do
    if [ "$Id" != "Id" ]; then
        username="${Prenom}${Nom}"

        # Supprimer les caractères de retour à la ligne dans la colonne role csv
        Role=$(echo "$Role" | tr -d '\r')
        echo "Id: $Id, Prenom: $Prenom, Nom: $Nom, Mdp: $Mdp, Role: $Role"
        if id "$username" &>/dev/null; then
            echo "L'utilisateur $username existe déjà."
        else
            useradd -m -u "$Id" "$username"
            echo "$username:${Mdp}" | chpasswd
            echo "L'utilisateur $username a été créé."

            # Vérifie si le rôle est admin 
            if [[ "$Role" == "Admin" ]]; then
		#ajoute les admin au groupe sudo
                sudo usermod -aG sudo "$username"
                echo "L'utilisateur $username a été ajouté au groupe sudo."
            else
                echo "L'utilisateur $username n'est pas administrateur."
            fi
        fi
    fi
done < "$csv_file"
