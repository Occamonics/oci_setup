## References
https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.36.0/oci_cli_docs/index.html

## Health check
```sh
oci os ns get
```

## Compartment 
### List
```sh
oci iam compartment list --include-root
oci iam compartment list --generate-full-command-json-input
```

### create 

```sh
oci iam compartment create
```

#### Required Params
```
    --compartment-id -c
    --description
    --name [text]
```
