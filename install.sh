# retrieve the root compartment
alias oci='docker run --rm -it -v "./:/oracle/script" -v "$HOME/.oci:/oracle/.oci" oci'
ROOT_COMPARTMENT_ID=$(oci iam compartment list --include-root --query "data[?\"compartment-id\"==null].id | [0]" --raw-output | tr -d '\r')

#echo "$ROOT_COMPARTMENT_ID" # DEBUG

oci iam compartment create -c "${ROOT_COMPARTMENT_ID}" --from-json file://~/script/compartment.dev.json --debug
oci iam compartment create -c "${ROOT_COMPARTMENT_ID}" --from-json file://~/script/compartment.prod.json --debug

