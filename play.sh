sudo service elasticsearch start
sudo service kibana start

sudo ln -sf /home/vagrant/src/02-beats-input-push.conf /etc/logstash/conf.d/02-beats-input-push.conf
sudo ln -sf /home/vagrant/src/10-syslog-filter.conf /etc/logstash/conf.d/10-syslog-filter.conf
sudo ln -sf /home/vagrant/src/30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf
sudo service logstash start

sudo ln -sf /home/vagrant/src/kibana-conf /etc/nginx/sites-enabled/kibana-conf
sudo service nginx start
