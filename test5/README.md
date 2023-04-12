## Test5 Bundle

### Deploys test.json (modified version of 2 subnet VNET from Azure Quickstarts)

Run as is or follow the steps below to modify and create your own Porter bundle based off this simple example

- ```porter create```
- replace porter.yaml, Dockerfile.tmpl and Helpers.sh
- update porter.yaml with new registry location
- ```porter build --debug```
- ```porter publish --debug```
