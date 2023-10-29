import { useState, useEffect } from "react";
// import reactLogo  from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import "./App.css";
import zk_texas_holdem_program from "../zk_texas_holdem/build/main.aleo?raw";
import { AleoWorker, AleoRemoteWorker } from "./workers/AleoWorker.js";
import init, { js_generate_phi_n, js_generate_key_pair } from "zk_poker_worker";
import { Address, PrivateKey } from "@aleohq/sdk";
import { BeatLoader } from "react-spinners";

const aleoWorker: AleoRemoteWorker = AleoWorker() as AleoRemoteWorker;

function App() {
  // Start Poker Logic
  const BIT_SIZE = 32;
  const BURN_ADDRESS =
    "aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc";
  const ZK_TEXAS_HOLDEM: string = zk_texas_holdem_program;
  const [isLoadingPlayers, setIsLoadingPlayers] = useState(true);
  const [isLoading, setIsLoading] = useState(true);
  const [_accountKeys, setAccountKeys] = useState<any>([]);
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
  const [phiN, setPhiN] = useState<any>({});

  useEffect(() => {
    if (isLoadingPlayers) {
      // Initialize the Wasm module
      (async () => {
        await generateAccounts(2);
      })();
    }
    if (isLoading) {
      // Initialize the Wasm module
      (async () => {
        await init();
        const phiN = await js_generate_phi_n(BIT_SIZE);
        setPhiN(phiN);
      })();
      setIsLoading(false);
    }
  }, []);

  type AccountData = {
    private_key: string | PrivateKey;
    address: string | Address;
  };

  const generateAccount = async (): Promise<AccountData> => {
    const proxy: typeof Proxy<[PrivateKey, Address]> =
      await aleoWorker.getAddressKeyPair();
    let key_proxy: any = proxy[0];
    let addr_proxy: any = proxy[1];
    const private_key: string = await key_proxy.to_string();
    const address: string = await addr_proxy.to_string();
    console.log(address);
    return { private_key, address };
  };

  const generateAccounts = async (count: number = 2): Promise<void> => {
    const accountsData: AccountData[] = [];

    for (let i = 0; i < count; i++) {
      const accountData = await generateAccount();
      accountsData.push(accountData);
    }

    setAccountKeys(accountsData);

    const updatedPlayerAddresses = [...playerAddresses];
    for (let i = 0; i < accountsData.length; i++) {
      updatedPlayerAddresses[i] = accountsData[i].address as string;
    }
    setPlayerAddresses(updatedPlayerAddresses);
    setIsLoadingPlayers(false);
  };

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
      const players = `"Players {
        player0: ${playerAddresses[0]},
        player1: ${playerAddresses[1]},
        player2: ${playerAddresses[2]},
        player3: ${playerAddresses[3]},
        player4: ${playerAddresses[4]},
        player5: ${playerAddresses[5]},
        player6: ${playerAddresses[6]},
        player7: ${playerAddresses[7]},
        player8: ${playerAddresses[8]},
      }"`;
      const phi = `"${phiN.phi}"u32`;
      const n = `"${phiN.n}"u32`;
      console.log([players, phi, n]);
      const gameResult = await aleoWorker.execute(
        "zk_texas_holdem.aleo",
        "setup_game",
        [players, phi, n],
        1.9
      );
      console.log(gameResult);
    } catch (error) {
      console.error("Error setting up the game:", error);
    }
  };

  const renderPlayerInputs = (startIndex: number, endIndex: number) => {
    return playerAddresses.slice(startIndex, endIndex).map((address, index) => (
      <div key={index}>
        <label>Player {startIndex + index + 1}:</label>
        <input
          className="address-input"
          type="text"
          value={address}
          onChange={(e) => {
            const updatedAddresses = [...playerAddresses];
            updatedAddresses[startIndex + index] = e.target.value;
            setPlayerAddresses(updatedAddresses);
          }}
        />
      </div>
    ));
  };

  if (isLoading || isLoadingPlayers) {
    return (
      <div className="spinner-container">
        <BeatLoader color="#FFFFFF" />{" "}
        {/* You can change the color or spinner type */}
      </div>
    );
  }

  return (
    // react-spinner if isLoading || isLoadingPlayers
    <div>
      <img src={aleoLogo} className="aleo-logo" alt="aleo logo" />
      <h1>zkTexasHoldem</h1>
      <h3>A Forray into Mental Poker</h3>
      <h2>Setup Game</h2>
      {phiN && (phiN.phi, phiN.n) ? (
        <div className="global-context">
          <div className="inline-field">
            <label>phi</label>
            <span>{phiN.phi}u32</span>
          </div>
          <div className="inline-field">
            <label>N</label>
            <span>{phiN.n}u32</span>
          </div>
        </div>
      ) : null}
      <div className="players-container">
        <div className="players-column">{renderPlayerInputs(0, 3)}</div>
        <div className="players-column">{renderPlayerInputs(3, 6)}</div>
        <div className="players-column">{renderPlayerInputs(6, 9)}</div>
      </div>
      <button onClick={handleSetupGame}>Start Poker Game</button>
    </div>
  );
}

export default App;
