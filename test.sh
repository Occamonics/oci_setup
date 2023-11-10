# retrieve the root compartment
alias oci='docker run --rm -it -v "./:/oracle/script" -v "$HOME/.oci:/oracle/.oci" oci'
ROOT_COMPARTMENT_ID=$(oci iam compartment list --include-root --query "data[?\"compartment-id\"==null].id | [0]" --raw-output | tr -d '\r')

DEV_COMPARTMENT_ID=$(oci iam compartment create -c "${ROOT_COMPARTMENT_ID}" --from-json file://~/script/RBAC/compartment.dev.json --query 'data.id' --raw-output | tr -d '\r')

echo "${DEV_COMPARTMENT_ID}"



#JSON_PATH="RBAC/compartment.dev.json"
#COMPARTMENT_NAME_DEV=$(grep -Eo '"name": "[^"]+"' "$JSON_PATH" | sed 's/"name": "\(.*\)"/\1/' | awk '{$1=$1;print}')
#oci iam domain create -c "${COMPARTMENT_ID_DEV}" --from-json file://~/script/domain/domain.dev.json --dry-run
