## Test5 Bundle

### Deploys test.json (modified version of 2 subnet VNET from Azure Quickstarts)

Run as is or follow the steps below to modify and create your own Porter bundle based off this simple example

- ```porter create```
- replace porter.yaml, Dockerfile.tmpl and Helpers.sh
- update porter.yaml with new registry location
- ```porter build --debug```
- ```porter publish --debug```

Passing through a parameter between ARM templates and Bundle can be seen by looking at the **vnetName** parameter.

In the test5.json ARM template it is initially referenced. It is prefixed by **CNAB_PARAM_** which means that the Azure CNAB Driver will pass it down to the CNAB bundle
In this sample it will simply use the name of the CNAB bundle as it's value. This can obviously be set to something else, or could even be set to a parameter defined in the top level ARM template (test5.json) !

```
		{
			"name": "CNAB_PARAM_vnetName",
			"value": "[variables('cnab_installation_name')]"
		},
```

In the porter.yaml file it is referenced twice.

Once to define the paramter:
```
- name: vnetName
  type: string
  description: VNET name
```

Then again to pass it down to the (test.json) ARM template being deployed as part of the bundle.

```
  - arm:
      description: ARM template to deploy an example
      name: sampledeploy
      resourceGroup: "{{ bundle.parameters.resource_group }}"
      template: test.json
      parameters:
        location: "{{ bundle.parameters.location }}"
        vnetName: "{{ bundle.parameters.vnetName }}"
```

Finally, test.json will reference it to use as the name of the VNET.

```
  "parameters": {
    "vnetName": {
      "type": "string",
      "defaultValue": "VNet1",
      "metadata": {
        "description": "VNet name"
      }
    }
```

*test.json is included in the bundle.*

Credentials will work in a similar fashion, being passed down when prefixed as **CNAB_CRED_** in the first ARM Template. In this case test5.json.
