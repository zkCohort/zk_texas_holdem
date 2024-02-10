import React, {FC, useEffect, useState} from "react";
import { useWallet } from '@demox-labs/aleo-wallet-adapter-react';
import { WalletAdapterNetwork, WalletNotConnectedError } from '@demox-labs/aleo-wallet-adapter-base';
import { LeoWalletAdapter } from '@demox-labs/aleo-wallet-adapter-leo';
import { useSelector, useDispatch } from 'react-redux';
import './GameTable.css';

const GameTable: FC = () => {
    const hands = Array.from({ length: 9 }, (_, i) => `hand-${i + 1}`);
    const cards = Array.from({ length: 5 }, (_, i) => `card-${i + 1}`);

    const { connected, wallet, publicKey, requestTransaction, requestRecords } = useWallet();
    const [fee, setFee] = useState<string>('1.529307');
    const [transactionId, setTransactionId] = useState<string | undefined>();
    const [status, setStatus] = useState<string | undefined>();
    
    useEffect(() => {
        let intervalId: NodeJS.Timeout | undefined;
    
        if (transactionId) {
        intervalId = setInterval(() => {
            getTransactionStatus(transactionId);
        }, 1000);
        }
    
        return () => {
        if (intervalId) {
            clearInterval(intervalId);
        }
        };
    }, [transactionId]);
    
    const getTransactionStatus = async (txId: string) => {
        const status = await (wallet?.adapter as LeoWalletAdapter).transactionStatus(txId);
        setStatus(status);
        if (status === 'Finalized' || status === 'Completed') {
        setStatus(undefined);
        setTransactionId(undefined);
        }
    };
    
    return (
        <div className="table">
          {hands.map((hand) => (
            <div key={hand} className={`hand ${hand}`}>:)</div>
          ))}
          {cards.map((card) => (
            <div key={card} className={`card ${card}`}></div>
          ))}
        </div>
    );
};

export default GameTable;