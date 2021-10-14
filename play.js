const Web3 = require("web3");
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
const hostpitalData = require("./build/contracts/Hospital.json");
const patientData = require("./build/contracts/Patient.json");

const address = {
    hospital: "0x9D43156eBCfcf83abBcBdC34f081156b561dC07F",
    owner: "0x8cD889a20e364562352352D498A4d5e0b1Ec7f98",
    account2: "0x21424b6785b4A18bFF196407Da02b535cE580375",
    patient: "0xf829f9Cbadfc8c4dB505a638f34383E53b2D19Ff",
    patientContract: "0xd8D26937E1A2B458FAe25A64d76cC9C43f64F6D2",
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
    // console.log(await PatientInstance.methods.getRecords().call());
    // console.log(await PatientInstance.methods.getExactRecord(0).call());
    // PatientInstance.methods.addRecord(Math.floor(Date.now() / 1000), "Duck Surgery", "Yoo", "Dude", "Nutchanon2 Chantrasup")
    // .send({ from: address.patient, gas: 3000000 });

}   

main();