import { wrap, Remote } from "comlink";

let singletonWorker: Remote<Worker> | undefined;

interface AleoRemoteWorker extends Remote<Worker> {
  localProgramExecution: (
    program: string,
    entrypoint: string,
    args: string[]
  ) => Promise<any>;
  deployProgram: (program: Uint8Array) => Promise<string>;
  getPrivateKey: () => Promise<any>;
  getAddressKeyPair: () => Promise<any>;
  generateAccount: () => Promise<any>;
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
