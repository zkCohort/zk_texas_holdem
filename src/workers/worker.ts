import {
  Address,
  Account,
  ProgramManager,
  PrivateKey,
  initThreadPool,
  AleoKeyProvider,
  AleoNetworkClient,
  NetworkRecordProvider,
} from "@aleohq/sdk";
import { expose, proxy } from "comlink";
import dotenv from "dotenv";
dotenv.config();

const ENDPOINT = process.env.VITE_ENDPOINT || "http://127.0.0.1:3030";
const PRIVATE_KEY = process.env.VITE_PRIVATE_KEY || "APrivateKey1";

await initThreadPool();

async function executeOffline(
  programName: string,
  functionName: string,
  inputs: string[]
) {
  const host = undefined;
  const keyProvider = undefined;
  const recordProvider = undefined;
  const programManager = new ProgramManager(host, keyProvider, recordProvider);

  const account = new Account();
  programManager.setAccount(account);

  const executionResponse = await programManager.execute(
    programName,
    functionName,
    0,
    false,
    inputs
  );
  return executionResponse;
}

async function execute(
  programName: string,
  functionName: string,
  inputs: string[],
  fee: number
) {
  const host = ENDPOINT;
  const keyProvider = undefined;
  const recordProvider = undefined;
  const programManager = new ProgramManager(host, keyProvider, recordProvider);
  const account = new Account({
    privateKey: PRIVATE_KEY,
  });
  programManager.setAccount(account);

  const executionResponse: string | Error = await programManager.execute(
    programName,
    functionName,
    fee,
    false,
    inputs
  );
  return executionResponse;
}

async function getPrivateKey() {
  const key = new PrivateKey();
  return proxy(key);
}

async function getAddressKeyPair() {
  const private_key = new PrivateKey();
  const address = Address.from_private_key(private_key);
  return proxy({ private_key: private_key, address: address });
}

async function deployProgram(program: string) {
  const keyProvider = new AleoKeyProvider();
  keyProvider.useCache(true);

  // Create a record provider that will be used to find records and transaction data for Aleo programs
  const networkClient = new AleoNetworkClient("https://vm.aleo.org/api");

  // Use existing account with funds
  const account = new Account({
    privateKey: PRIVATE_KEY,
  });

  const recordProvider = new NetworkRecordProvider(account, networkClient);

  // Initialize a program manager to talk to the Aleo network with the configured key and record providers
  const programManager = new ProgramManager(
    "https://vm.aleo.org/api",
    keyProvider,
    recordProvider
  );

  programManager.setAccount(account);

  // Define a fee to pay to deploy the program
  const fee = 1.9; // 1.9 Aleo credits

  // Deploy the program to the Aleo network
  const tx_id = await programManager.deploy(program, fee, false);

  // Optional: Pass in fee record manually to avoid long scan times
  // const feeRecord = "{  owner: aleo1xxx...xxx.private,  microcredits: 2000000u64.private,  _nonce: 123...789group.public}";
  // const tx_id = await programManager.deploy(program, fee, undefined, feeRecord);

  return tx_id;
}

const workerMethods = {
  executeOffline,
  execute,
  getPrivateKey,
  getAddressKeyPair,
  deployProgram,
};
expose(workerMethods);
