;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     localhost. root.localhost. (
                              3         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
@       IN      A       127.0.0.1
@       IN      AAAA    ::1
@       IN      NS      ns.example.com.
t1      IN      NS      t1ns.example.com.
t1ns    IN      A       52.156.0.169

example.com.    IN MX   10      mail.example.com.
mail    IN      A       13.88.250.188
ns      IN      A       172.17.0.2
s       IN      A       52.156.0.169
