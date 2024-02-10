import React, { useState, useEffect, FC, useMemo } from "react";
// Hook for data fetching
import useSWR from 'swr';
import reactLogo from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import { LeoWalletAdapter } from '@demox-labs/aleo-wallet-adapter-leo';
// Wallet decryption permission setting, WalletAdapeterNetwork enum
import { WalletAdapterNetwork, DecryptPermission } from '@demox-labs/aleo-wallet-adapter-base';
// Wallet context providers for React
import { WalletProvider } from '@demox-labs/aleo-wallet-adapter-react';
import { WalletModalProvider } from '@demox-labs/aleo-wallet-adapter-reactui';
// Wallet Adapter styles
import '@demox-labs/aleo-wallet-adapter-reactui/styles.css';
import "./App.css";
import SetupGame from "./containers/SetupGame";
import GameTable from "./containers/GameTable";

const App: FC = () => {
  // Memoized list of wallet adapters
  const wallets = useMemo(
    () => [
      new LeoWalletAdapter({
        appName: 'zkTexasHoldem',
      }),
    ],
    [],
  );
  
  // Fetch program data using SWR hook
  const { data, error, isLoading } = useSWR('programData', () => getProgram(NewsletterProgramId, TESTNET3_API_URL));
  

  return (
    <WalletProvider
      wallets={wallets}
      decryptPermission={DecryptPermission.AutoDecrypt}
      network={WalletAdapterNetwork.Localnet}
      autoConnect
    >
      <WalletModalProvider>
        <GameTable/>
        <SetupGame/>
      </WalletModalProvider>
    </WalletProvider>
  );
}

export default App;
