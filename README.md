# k8-single-yaml

Single YAML to install Contrail CNI components on a Kubernetes System 


Once you clone this repository You can update the contrail/default.yaml as below 

contrail_nodes= 10.87.65.232,10.87.65.233,10.87.65.234 #(IP address of Nodes where contrail control components are installed)
vrouter_physical_interface= eth1 #(Interface on which Vrouter is installed) 
api_vip:10.87.65.251 #(VIP IP of Kubernetes API server)

Steps to install once values are updated

kubectl apply -f contrail/
