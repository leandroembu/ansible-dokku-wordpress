# Ansible Dokku WordPress

Deploy Wordpress on Debian servers using Dokku. This role is powered by [dokku/ansible-dokku](https://github.com/dokku/ansible-dokku/) role.

## TODO

- [ ] Improve README with more role variables
- [x] Copy and import database dump
- [x] Set environment variables to skip WP installation page after site migration
- [ ] Create a custom php.ini to set some limits
- [ ] Use Dockerfile instead of Docker image

## Requirements

- A working Debian sever with ssh access
- A user with sudo privileges
- A local machine with ansible installed

## Role variables
**Important:** see the [dokku_bot.ansible_dokku variables](https://github.com/dokku/ansible-dokku#role-variables) first.
### app_name
- default: `wordpress`
- type: `string`
- description: `The app name`
### mariadb_service_name
- default: `mariadb_{{ app_name }}`
- type: `string`
- description: MariaDB service name. By default, its name is the app name with a prefix `mariadb_`.
### app_domain
- default: `wordpress.example.com`
- type: `string`
- description: App domain
### admin_email
- default: `admin@example.com`
- type: `string`
- description: Admin e-mail, which will be used to configure Let's Encrypt
### data_path
- default: `/var/lib/dokku/data/storage/{{ app_name }}`
- type: `string`
- description: Path to store app's data
### app_docroot
- default: `/var/www/html/`
- type: `string`
- description: Webserver's document root

## Example Playbooks
```yaml
---
- hosts: all
  roles:
    - { role: ansible-dokku-wordpress, become: yes }
  vars:
    dokku_users:
      - name: "Leandro Ramos"
        username: leandro
        ssh_key: "{{lookup('file', '~/.ssh/id_rsa.pub')}}"
    dokku_plugins:
      - name: mariadb
        url: https://github.com/dokku/dokku-mariadb.git
      - name: letsencrypt
        url: https://github.com/dokku/dokku-letsencrypt.git
```

License
-------

GNU GPL v3.0

