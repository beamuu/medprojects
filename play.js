const Web3 = require("web3");
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
const hostpitalData = require("./build/contracts/Hospital.json");

const address = {
    hospital: "0x02C51e3c44e43A8feF5E6fF30995A1638F0e7d97",
    owner: "0x90218340BCa12B425AA3Ad4B69C0e8d4Ae9Caa55",
}

async function main() {
    const HospitalInstance = new web3.eth.Contract(hostpitalData.abi, address.hospital);
    console.log(await HospitalInstance.methods.hospitalName().call());
    const firstPatient = await HospitalInstance.methods.createPatient("0xa34fD85de83578469C2C28a73F921Ea6840E4aaC").send({ from: address.owner, gas: 3000000 } );
    console.log(firstPatient);
}   
main();