# DevOps Examen 2016
Het doel van dit examen is het opzetten van een Vagrant/Ansible configuratie
waarmee we op een simpele manier wisselen tussen de bleeding edge en de stable
versie van een website. Switchen tussen de verschillende versies van de website
moet gebeuren door het uitchecken van de respectievelijke branch van een git
repository.

De git repository voor de website:  
https://github.com/AP-Elektronica-ICT/do_rollback_website

De branches zijn:
* bleeding 
* stable

De aanzet voor deze configuratie is gegeven en er zijn placeholders voor de
files die nog een aanpassing nodig hebben. Dit geeft volgende folder:
```
do_examen16_start/
├── ansible.cfg
├── ansible.sh
├── bleeding.yml
├── hosts
├── inventory
├── roles
│   └── web
│       ├── files
│       │   └── rollback
│       └── tasks
│           └── main.yml
├── stable.yml
├── Vagrantfile
└── webrole.yml
```

Nadat het examen voltooid is moet deze folder met de aanpassing gezipt worden
als `do_examen16_achternaamvoornaam` en ingediend worden via blackboard.

## Aanpassingen
* In de Vagrantfile wordt naast de manager vm, een tweede vm toegevoegd die
  nginx als webserver draait. Deze vm heeft volgende eigenschappen
  * Hostname = `www1.dev`
  * Privaat IP: `192.168.55.89`
  * Portforwarding voor SSH
  * Portforwarding van poort `8089` op de host naar poort `80` op de vm

* De web role moeten worden afgemaakt deze wordt aangeroepen door de playbook
  `webrole.yml` Deze role installeert en configureert de nginx webserver. De
  configuratie file voor de webserver staat op volgende locatie
  `roles/web/files/rollback`. Git moet ook geinstalleerd worden en heeft geen
  configuratie nodig.

* De playbook `bleeding.yml` aanpassen zodat deze de `bleeding` branch pulled.
  De destination staat in de config file van de website.


* De playbook `stable.yml` aanpassen zodat deze de `stable` branch pulled.
  De destination staat in de config file van de website.


## Verbetersleutel

Volgende sequentie commando's zal er worden uitgevoerd worden ter verbetering
van het ingediende examen.

1. `cd do_examen16_achternaamvoornaam`
2. `vagrant up`            
3. `vagrant ssh mgr`
4. `cd /vagrant/`
5. `ansible-playbook webrole.yml`
6. `ansible-playbook bleeding.yml`
7. Navigeer naar http://localhost:8089 vanuit de host omgeving && controleer
   website op bleeding edge versie
8. `ansible-playbook stable.yml`
9. Navigeer naar http://localhost:8089 vanuit host omgeving && controleer
  website op stable versie

## Indienen
Via BlackBoard


***Veel Succes***



