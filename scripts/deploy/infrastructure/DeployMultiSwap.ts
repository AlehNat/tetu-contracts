import {DeployerUtils} from "../DeployerUtils";
import {ethers} from "hardhat";
import {MultiSwap} from "../../../typechain";
import {MaticAddresses} from "../../../test/MaticAddresses";


async function main() {
  const signer = (await ethers.getSigners())[0];
  const core = await DeployerUtils.getCoreAddresses();
  const tools = await DeployerUtils.getToolsAddresses();

  const multiSwap = await DeployerUtils.deployMultiSwap(signer, core.controller, tools.calculator) as MultiSwap;

  await DeployerUtils.wait(5);
  await DeployerUtils.verifyWithArgs(multiSwap.address, [
    core.controller,
    tools.calculator,
    [
      MaticAddresses.QUICK_FACTORY,
      MaticAddresses.SUSHI_FACTORY,
      MaticAddresses.WAULT_FACTORY
    ],
    [
      MaticAddresses.QUICK_ROUTER,
      MaticAddresses.SUSHI_ROUTER,
      MaticAddresses.WAULT_ROUTER
    ]
  ]);
}

main()
.then(() => process.exit(0))
.catch(error => {
  console.error(error);
  process.exit(1);
});
