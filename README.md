# Vagrant ELK

### Dependencies
- Vagrant

### Usage
- Clone the repo.
- `cd` into the repo
- run `vagrant up`
- Wait for the initial provisioning to complete.
- Go to kibana by hitting [http://localhost:4444](http://localhost:4444) in your local machine.

### Filebeats config
You can use the following configuration snippet to connect your beats to elasticsearch:
```
output.elasticsearch:
   # Array of hosts to connect to.
   hosts: ["http://localhost:4444/elasticsearch/"]
```
or logstash:
```
output.logstash:
  # The Logstash hosts
  hosts: ["http://localhost:4444/logstash/"]
```
