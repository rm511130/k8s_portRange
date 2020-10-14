pks login -a https://api.pks.pks4u.com:9021 -u pks_admin -p password -k
printf 'password\n' | pks get-credentials small
cat networkpolicy_input.yaml | awk -f portRange-2-ports.awk > networkpolicy.yaml
kubectl apply -f networkpolicy.yaml 
sleep 5
kubectl describe networkpolicies.networking.k8s.io
