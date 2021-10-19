const Hospital = artifacts.require("../contracts/Hospital.sol");

module.exports = async function (deployer) {
    await deployer.deploy(Hospital, "Medprojects (Testnet)", "12345678", "Official Medprojects Testnet Smart Contracts", "Bangkok, Thailand");
};
