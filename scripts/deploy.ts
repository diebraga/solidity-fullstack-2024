import { ethers } from "hardhat";
import fs from "fs";
import { join } from "path";

async function main() {
  const contract = await ethers.deployContract("SimpleStorage");

  await contract.waitForDeployment();

  const contractAddress = await contract.getAddress();
  // log contract address
  console.log(`contract deployed to ` + contractAddress);

  // Update constants.ts
  const constantsPath = join(__dirname, "../constants.ts");
  const content = `export const constants = {\n  latestContractAddress: "${contractAddress}",\n};\n`;
  fs.writeFileSync(constantsPath, content, "utf8");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
