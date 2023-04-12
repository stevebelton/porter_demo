## Test5 Bundle

### Deploys test.json (modified version of 2 subnet VNET from Azure Quickstarts)

- ```porter create```
- replace porter.yaml, Dockerfile.tmpl and Helpers.sh
- update porter.yaml with new registry location
- ```porter build --debug```
- ```porter publish --debug```
