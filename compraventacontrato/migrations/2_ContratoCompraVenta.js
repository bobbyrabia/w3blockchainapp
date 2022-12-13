const ContratoCompraVenta = artifacts.require("ContratoCompraVenta.sol");

module.exports = function (deployer) {
  deployer.deploy(ContratoCompraVenta);
};