<p align="center">
<img src="https://github.com/nutchanonc/medprojects-frontend/blob/main/public/github-banner.png?raw=true" width="100%"/>
</p>

<br />
<br />

![Solidity](https://img.shields.io/badge/Solidity-%23363636.svg?style=for-the-badge&logo=solidity&logoColor=white)
![Ethereum](https://img.shields.io/badge/Ethereum-3C3C3D?style=for-the-badge&logo=Ethereum&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
<br />
<br />


```
A medical smart contract project
```

Medprojects is a implementation of Ethereum Smart Contract for storing patients' medical data and reports. Medprojects is now a prototype and to be  developed as a full application in future. Right now, we are testing on `Binance Smart Chain Testnet` and aiming to launch in to a low gas fee blockchain.

- For frontend source code please [visit here](https://github.com/nutchanonc/medprojects-frontend).


### Checkout our prototype [here](https://medprojects.nutchanon.co).

- Our prototype requires MetaMask (Ethereum Wallet) which needs to be installed as a browser extension.
[Visit MetaMask](https://metamask.io/)

<br /><br /><br />

## Deployment & Configurations (For Hospital)

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
