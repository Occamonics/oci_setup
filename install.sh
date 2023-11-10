# Function to run the cleanup or follow-up script
cleanup_script() {
    echo "Running cleanup script..."
    ./clean_up_script.sh  # Replace with the actual path to your script
}

# Set a trap to run the cleanup script on script exit
trap cleanup_script EXIT

# Enable exit on error
set -e

# retrieve the root compartment
alias oci='docker run --rm -it -v "./:/oracle/script" -v "$HOME/.oci:/oracle/.oci" oci'
ROOT_COMPARTMENT_ID=$(oci iam compartment list --include-root --query "data[?\"compartment-id\"==null].id | [0]" --raw-output | tr -d '\r')

DEV_COMPARTMENT_ID=$(oci iam compartment create -c "${ROOT_COMPARTMENT_ID}" --from-json file://~/script/RBAC/compartment.dev.json --query 'data.id' --raw-output | tr -d '\r')
#oci iam compartment create -c "${ROOT_COMPARTMENT_ID}" --from-json file://~/script/compartment.prod.json

oci iam domain create -c "${DEV_COMPARTMENT_ID}" --from-json file://~/script/domain/domain.dev.json

#status_code=$?
#
#if [ ${status_code} -eq 0 ]; then
#  echo "success"
#
#elif [ ${status_code} -eq 2 ]; then
#  echo ""
#
#else
#    echo error
#fi

