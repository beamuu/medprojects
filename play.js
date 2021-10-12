const Web3 = require("web3");
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
const hostpitalData = require("./build/contracts/Hospital.json");
const patientData = require("./build/contracts/Patient.json");

const address = {
    hospital: "0x464DF2A31d36eDA7bb5F330216c4F8a3E4d65E63",
    owner: "0x7425592Bc18AF33f92f7D9E6A4A563BE62a33A6C",
    account2: "0x21424b6785b4A18bFF196407Da02b535cE580375",
    patient: "0x017a6085F31b6db89e07DcC6eb55C2f5B7aaAfAb",
    patientContract: "0x5e1D03169F9409F17F1bE002b935f821D7A08707",
}

async function main() {
    const HospitalInstance = new web3.eth.Contract(hostpitalData.abi, address.hospital);
    // console.log(await HospitalInstance.methods.owner().call());
    // console.log(await HospitalInstance.methods.hospitalName().call());
    // console.log(await HospitalInstance.methods.hospitalLicense().call());
    // console.log(await HospitalInstance.methods.hospitalLocation().call());
    // await HospitalInstance.methods.selfCreatePatient(address.patient)
    //     .send({ from: address.owner, gas: 3000000 } );
    // console.log(await HospitalInstance.methods.getPatient(address.patient).call());

    const PatientInstance = new web3.eth.Contract(patientData.abi, address.patientContract);
    // console.log(await PatientInstance.methods.hospital().call());
    // console.log(await PatientInstance.methods.owner().call());
    // await HospitalInstance.methods.addRecord(address.patient, Math.floor(Date.now() / 1000), "Magical Surgery", "Hello", "Word", "Nutchanon Chantrasup")
    // .send({ from: address.owner, gas: 3000000 } );
    console.log(await PatientInstance.methods.getRecords().call());
    console.log(await PatientInstance.methods.getExactRecord(0).call());
    PatientInstance.methods.addRecord(Math.floor(Date.now() / 1000), "Duck Surgery", "Yoo", "Dude", "Nutchanon2 Chantrasup")
    .send({ from: address.patient, gas: 3000000 } );

}   

main();