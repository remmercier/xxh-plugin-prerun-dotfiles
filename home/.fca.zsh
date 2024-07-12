fca_hosts="
10.192.10.251 qa-fca-ng-bastion
10.192.20.106 qa-fca-ng-solr-slave-a1
10.192.20.114 qa-fca-ng-user-account-a1
10.192.20.191 qa-fca-ng-solr-master-a1
10.192.20.235 qa-fca-ng-crm-a1
10.192.20.30 qa-fca-ng-admin-a1
10.192.20.42 qa-fca-ng-dealer-interface-a1
10.192.20.58 qa-fca-ng-api-a1
10.192.20.75 qa-fca-ng-weblg-a1
10.192.20.91 qa-fca-ng-sling-a1
10.192.20.94 qa-fca-ng-brand-renderer-a1
10.192.21.131 qa-fca-ng-api-b1
10.192.21.158 qa-fca-ng-crm-b1
10.192.21.168 qa-fca-ng-solr-slave-b1
10.192.21.174 qa-fca-ng-sling-b1
10.192.21.241 qa-fca-ng-weblg-b1
10.192.21.31 qa-fca-ng-user-account-b1
10.192.21.74 qa-fca-ng-brand-renderer-b1

10.192.10.81 uat-fca-ng-bastion
10.192.20.113 uat-fca-ng-brand-renderer-a1
10.192.20.142 uat-fca-ng-sling-a1
10.192.20.164 uat-fca-ng-dealer-interface-a1
10.192.20.185 uat-fca-ng-solr-master-a1
10.192.20.192 uat-fca-ng-solr-slave-a1
10.192.20.203 uat-fca-ng-weblg-a1
10.192.20.218 uat-fca-ng-api-a1
10.192.20.37 uat-fca-ng-crm-a1
10.192.20.65 uat-fca-ng-user-account-a1
10.192.21.109 uat-fca-ng-sling-b1
10.192.21.116 uat-fca-ng-solr-slave-b1
10.192.21.196 uat-fca-ng-weblg-b1
10.192.21.203 uat-fca-ng-user-account-b1
10.192.21.37 uat-fca-ng-api-b1
10.192.21.70 uat-fca-ng-brand-renderer-b1
10.192.21.71 uat-fca-ng-app-b1
10.192.21.81 uat-fca-ng-crm-b1

10.192.10.193 prod-fca-ng-report-a1
10.192.10.75 prod-fca-ng-bastion
10.192.10.85 prod-fca-public-mysql-proxy
10.192.20.117 prod-fca-ng-crm-a1
10.192.20.124 prod-fca-ng-api-a2
10.192.20.204 prod-fca-ng-weblg-a1
10.192.20.212 prod-fca-ng-solr-slave-a1
10.192.20.31 prod-fca-ng-user-account-a1
10.192.20.34 prod-fca-ng-api-a1
10.192.20.41 prod-fca-ng-solr-master-a1
10.192.20.42 prod-fca-ng-sling-a1
10.192.20.59 prod-fca-ng-dealer-interface-a1
10.192.20.7 prod-fca-ng-brand-renderer-a1
10.192.20.74 prod-fca-ng-brand-renderer-a2
10.192.20.82 prod-fca-ng-api-quartz-a1
10.192.21.100 prod-fca-ng-api-quartz-b1
10.192.21.125 prod-fca-ng-api-b1
10.192.21.173 prod-fca-ng-brand-renderer-b2
10.192.21.20 prod-fca-ng-user-account-b1
10.192.21.204 prod-fca-ng-weblg-b1
10.192.21.231 prod-fca-ng-crm-b1
10.192.21.249 prod-fca-ng-solr-slave-b1
10.192.21.253 prod-fca-ng-brand-renderer-b1
10.192.21.76 prod-fca-ng-sling-b1
10.192.21.90 prod-fca-ng-api-b2
"

function whereami() {
  echo $fca_hosts | grep $(ipi) | cut -d' ' -f2
}
