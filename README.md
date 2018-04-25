# k8-single-yaml

Single YAML to install Contrail CNI components on a Kubernetes System 


Once you clone this repository You can run the below script to install Contrail

./config.sh  

```
##############**SINGLE NODE**#############
./config.sh 

This script will install contrail on a Kubernetes cluster

Contrail Nodes (This is a list of nodes on which Contrail Components are installed)
eg for Single Node- Contrail Nodes: 10.87.65.231
eg for HA- Contrail Nodes: 10.87.65.231,10.87.65.232,10.87.65.233
Contrail Nodes [ENTER]:10.87.65.231

Please enter the Kubernetes Master VIP IP(In case of Single Master use Master node IP)
eg Kubernetes VIP: 10.87.65.231
Kubernetes VIP [ENTER]: 10.87.65.231

Please enter the Physical Interface for the VROUTER
 eg Vrouter Interface: eth2
Vrouter Interface [ENTER]: eth2

Please enter the Registry for the Contrail Docker images
eg contrail_registry: docker.io/opencontrailnightly
Disclaimer: Please do not enter the http/https urls but docker friendly url
contrail_registry [ENTER]: docker.io/opencontrailnightly

Please enter the Contrail Image Tag(Version) that you want installed
eg contrail_tag: newton-master-44
contrail_tag [ENTER]:newton-master-44

Installing Contrail

Contrail Installed



##############**CONTRAIL HA SETUP**#############
./config.sh 

This script will install contrail on a Kubernetes cluster

Contrail Nodes (This is a list of nodes on which Contrail Components are installed)
eg for Single Node- Contrail Nodes: 10.87.65.231
eg for HA- Contrail Nodes: 10.87.65.231,10.87.65.232,10.87.65.233
Contrail Nodes [ENTER]:10.87.65.231,10.87.65.232,10.87.65.233

Please enter the Kubernetes Master VIP IP(In case of Single Master use Master node IP)
eg Kubernetes VIP: 10.87.65.231
Kubernetes VIP [ENTER]: 10.87.65.231

Please enter the Physical Interface for the VROUTER
 eg Vrouter Interface: eth2
Vrouter Interface [ENTER]: eth2

Please enter the Registry for the Contrail Docker images
eg contrail_registry: docker.io/opencontrailnightly
Disclaimer: Please do not enter the http/https urls but docker friendly url
contrail_registry [ENTER]: docker.io/opencontrailnightly

Please enter the Contrail Image Tag(Version) that you want installed
eg contrail_tag: newton-master-44
contrail_tag [ENTER]:newton-master-44

Installing Contrail

Contrail Installed



````

````
For Kubernetes Install 
Refer [Installing K8's on CentOS](kubernetes/Install_K8.md)
