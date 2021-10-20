# About Medprojects

### Objectives
- Allow patients to store their medical records on the blockchain which can access with the patient's contract addresses.
- Solve the old problems about requesting medical records for another hospital. Right now you can give the patient's contract addresses to the new hospital and let them access to your old records.

### How it works
There are 2 smart contracts first is the hospital contract and patient contract

### `Hospital contract`
Hospital contract were created by hospitals or medical providers. The hospital contract can create patient contracts and add the record to the specific patient.

### `Patient contract`
Patient contract stores individual medical records for each account. Records can be added by the owned hospital only.

After you create account by using `createPatient()` the new patient contract will be create with a unique contract address which is called `patient contract address`. This contract will be your data storage. It holds all of your medical records that was created by the hospital which you `createPatient()` with. There is only one way to add the records to your patient contract, by calling `addRecord()` method with the hospital account. This means only the real hospotal account can add records to your contract.

```sol


The patient contract has been set owner variable to private. No one can view the

### MedScan
MedScan is a record explorer which located on the top-right of the medproject's website. MedScan searchs the record from `patient contract address` and the `record index`.
Plase remember that any published records can be view by anyone if they know both of the search factor.
But your MetaMask address won't be publish.
