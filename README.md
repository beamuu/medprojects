# Medprojects
Medical smart contract project

### Clone the contracts for your hospital

```shell
$ git clone https://github.com/nutchanonc/medprojects
```

### Config general contracts information

These variables are the hospital information.

```sol
    string public hospitalName;
    string public hospitalId;
    string public hospitalLicense;
    string public hospitalLocation;
```

You can set these value since the deployment (in `constructor`)

```sol
    constructor(
        string memory _hospitalName,
        string memory _hospitalId,
        string memory _hospitalLicense,
        string memory _hospitalLocation
    )
```
Example of `constructor` in deployment script. (Truffle)

```js
    await deployer.deploy(Hospital, "Medprojects (Testnet)", "12345678", "Official Medprojects Testnet Smart Contracts", "Bangkok, Thailand");
```

Then deploy the contracts and your hospital is ready!
