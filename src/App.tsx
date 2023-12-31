import { useState, useEffect } from "react";
import reactLogo from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import "./App.css";
import zk_texas_holdem_program from "../zk_texas_holdem/build/main.aleo?raw";
import zk_deck_shuffle_program from "../zk_texas_holdem/imports/zk_deck_shuffle.leo?raw";
import { AleoWorker } from "./workers/AleoWorker.js";
import init, { js_generate_phi_n, js_generate_key_pair } from "zk_poker_worker";
import { Remote } from "comlink";

const aleoWorker: Remote<Worker> = AleoWorker();

function App() {
  // Start Poker Logic
  const BIT_SIZE = 32;
  const BURN_ADDRESS =
    "aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc";
  const ZK_TEXAS_HOLDEM = zk_texas_holdem_program;
  const [accountKeys, setAccountKeys] = useState<any>([]);
  const [playerAddresses, setPlayerAddresses] = useState([
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
    BURN_ADDRESS,
  ]);
  const [players, setPlayers] = useState(""); // Adjust the type and initial value accordingly.
  const [phiN, setPhiN] = useState<any>({});

  useEffect(() => {
    // Initialize the Wasm module
    init().then(() => {
      console.log("Wasm module initialized");
      const phi_n_obj = js_generate_phi_n(BIT_SIZE);
      setPhiN(phi_n_obj);
    });
  }, []);

  useEffect(() => {
    (async () => {
      await generateAccounts(2);
    })();
  }, []);

  type AccountData = {
    private_key: string;
    address: string;
};

const generateAccount = async (): Promise<AccountData> => {
    const keypair: AccountData = await aleoWorker.getAddressKeyPair();
    const private_key = await keypair.private_key.to_string();
    const address = await keypair.address.to_string();
    console.log(address);
    return { private_key, address };
};

const generateAccounts = async (count: number = 2): Promise<void> => {
  const accountsData: AccountData[] = [];

  for(let i = 0; i < count; i++) {
      const accountData = await generateAccount();
      accountsData.push(accountData);
  }

  setAccountKeys(accountsData);

  const updatedPlayerAddresses = [...playerAddresses];
  for(let i = 0; i < accountsData.length; i++) {
      updatedPlayerAddresses[i] = accountsData[i].address;
  }
  setPlayerAddresses(updatedPlayerAddresses);
};

  // async function execute() {
  //   setExecuting(true);
  //   const result = await aleoWorker.localProgramExecution(
  //     zk_texas_holdem,
  //     "main",
  //     ["5u32", "5u32"]
  //   );
  //   setExecuting(false);

  //   alert(JSON.stringify(result));
  // }

  // async function deploy() {
  //   setDeploying(true);
  //   try {
  //     const result = await aleoWorker.deployProgram(zk_texas_holdem_program);
  //     console.log("Transaction:");
  //     console.log("https://explorer.hamp.app/transaction?id=" + result);
  //     alert("Transaction ID: " + result);
  //   } catch (e) {
  //     console.log(e);
  //     alert("Error with deployment, please check console for details");
  //   }
  //   setDeploying(false);
  // }

  const handleSetupGame = async () => {
    try {
      // Convert the inputs as necessary (e.g., string to integer, etc.)
      // players is a struct of the form:
      // struct Player {
      //   player0: "address",
      //   player1: "address",
      //   player2: "address",
      //   player3: "address",
      //   player4: "address",
      //   player5: "address",
      //   player6: "address",
      //   player7: "address",
      //   player8: "address",
      // }
      let players = {
        player0: playerAddresses[0],
        player1: playerAddresses[1],
        player2: playerAddresses[2],
        player3: playerAddresses[3],
        player4: playerAddresses[4],
        player5: playerAddresses[5],
        player6: playerAddresses[6],
        player7: playerAddresses[7],
        player8: playerAddresses[8],
      }

      const gameResult = await aleoWorker.localProgramExecution(
        ZK_TEXAS_HOLDEM,
        "setup_game",
        [players, phiN.phi, phiN.n]
      );
      console.log(gameResult);
    } catch (error) {
      console.error("Error setting up the game:", error);
    }
  };

  return (
    <div>
      <h1>zkTexasHoldem</h1>
      {playerAddresses.map((address, index) => (
        <div key={index}>
          <label>Player {index + 1}:</label>
          <input className="address-input"
            type="text"
            value={address}
            onChange={(e) => {
              const updatedAddresses = [...playerAddresses];
              updatedAddresses[index] = e.target.value;
              setPlayerAddresses(updatedAddresses);
            }}
          />
        </div>
      ))}
      {phiN && (phiN.phi, phiN.n) ? (
      <div>
        <p>phi: {phiN.phi}</p>
        <p>n: {phiN.n}</p>
      </div>) : null}
      <button onClick={handleSetupGame}>Start Poker Game</button>
    </div>
  );
}

export default App;
