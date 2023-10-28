import { wrap, Remote } from "comlink";

let singletonWorker: Remote<Worker> | undefined;

interface AleoRemoteWorker extends Remote<Worker> {
  executeOffline: (
    programName: string,
    functionName: string,
    inputs: string[]
  ) => Promise<any>;
  execute: (
    programName: string,
    functionName: string,
    inputs: string[],
    fee: number
  ) => Promise<any>;
  deployProgram: (program: string) => Promise<string>;
  getPrivateKey: () => Promise<typeof Proxy>;
  getAddressKeyPair: () => Promise<typeof Proxy>;
  generateAccount: () => Promise<typeof Proxy>;
}

const AleoWorker = () => {
  if (!singletonWorker) {
    const worker = new Worker(new URL("worker.ts", import.meta.url), {
      type: "module",
    });

    worker.onerror = function (event) {
      console.error("Error in worker: " + event?.message);
    };

    singletonWorker = wrap(worker);
  }
  return singletonWorker;
};

export type { AleoRemoteWorker };
export { AleoWorker };
