const Hospital = artifacts.require("../contracts/Hospital.sol");

module.exports = async function (deployer) {
    await deployer.deploy(Hospital, "Sample Hospital", "123456789", "729034857023894523", "Bangkok, Thailand");
};
