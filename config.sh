echo "Hello, "$USER".  This script will install contrail on a Kubernetes cluster"

echo "Contrail Nodes (This is a list of nodes on which Contrail Components are installed)"
echo "eg for Single Node- Contrail Nodes: 10.87.65.231"
echo "eg for HA- Contrail Nodes: 10.87.65.231,10.87.65.232,10.87.65.233" 
echo -n "Contrail Nodes [ENTER]:"
read contrail_nodes

echo "Please enter the Kubernetes Master VIP IP(In case of Single Master use Master node IP)"
echo "eg Kubernetes VIP: 10.87.65.231"
echo -n "Kubernetes VIP [ENTER]: "
read  kube_api_vip

echo "Please enter the Physical Interface for the VROUTER"
echo " eg Vrouter Interface: eth2"
echo -n "Vrouter Interface [ENTER]: "
read  vrouter_physical_interface

echo "Please enter the Registry for the Contrail Docker images"
echo "eg contrail_registry: docker.io/opencontrailnightly"
echo " Disclaimer: Please do not enter the http/https urls but docker friendly url" 
echo -n "contrail_registry [ENTER]: "
read  contrail_registry

echo "Please enter the Contrail Image Tag(Version) that you want installed"
echo "eg contrail_tag: newton-master-44"
echo -n "contrail_tag [ENTER]:"
read contrail_container_tag


export contrail_nodes=$contrail_nodes
export kube_api_vip=$kube_api_vip
export contrail_registry=$contrail_registry
export contrail_container_tag=$contrail_container_tag
export vrouter_physical_interface=$vrouter_physical_interface
for f in contrail/*.yaml
do
envsubst < $f > ".generated/$(basename $f)"
done
echo " Installing Contrail" 
kubectl apply -f .generated/
