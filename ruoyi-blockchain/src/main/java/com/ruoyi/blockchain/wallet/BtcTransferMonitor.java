package com.ruoyi.blockchain.wallet;

import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.EthBlock;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.Transaction;
import rx.Subscription;
import rx.functions.Action1;

import java.math.BigInteger;
import java.util.Arrays;

public class BtcTransferMonitor {
    private static BtcTransferMonitor instance;
    private Web3j web3j;


    public static BtcTransferMonitor getInstance() {
        if (instance == null) {
            synchronized (BtcTransferMonitor.class) {
                if (instance == null) {
                    instance = new BtcTransferMonitor();
                }
            }
        }
        return instance;
    }

    public Web3j getWeb3j() {
        return web3j;
    }

    public void setWeb3j(Web3j web3j) {
        this.web3j = web3j;
    }

    public Subscription subscribeBlock(final Action1<? super EthBlock> onNext) {
        if (this.web3j == null) return null;
        return this.web3j.blockObservable(true).subscribe(onNext);
    }

    public void unsubscribeBlock(Subscription subscription) {
        if (this.web3j == null) return;
        subscription.unsubscribe();
    }

    /**
     * 监听新交易事件
     * 已经交易的事件
     * mark
     **/
    public Subscription subscribeHasTrans(final Action1<? super Transaction> onNext) {
        if (this.web3j == null) return null;
        return web3j.transactionObservable().subscribe(onNext);
    }

    /**
     * 取消订阅信息
     **/
    public void unsubscribeHasTrans(Subscription subscription) {
        if (this.web3j == null) return;
        subscription.unsubscribe();
    }

    /**
     * 监听待定交易
     */
    public Subscription subscribePendingTrans(final Action1<? super Transaction> onNext) {
        if (this.web3j == null) return null;
        return web3j.pendingTransactionObservable().subscribe(onNext);
    }

    /**
     * 取消订阅信息
     **/
    public void unsubscribePendingTrans(Subscription subscription) {
        if (this.web3j == null) return;
        subscription.unsubscribe();
    }


    /**
     * 监听合约的交易事件
     **/
    public Subscription subscribeContract(String contractAddress, final Action1<? super Log> onNext) {
        if (this.web3j == null) return null;

        // 要监听的合约事件 交易
        EthFilter filter = new EthFilter(
                DefaultBlockParameter.valueOf(BigInteger.valueOf(0L)),
                DefaultBlockParameterName.LATEST,
                contractAddress);
        Event event = new Event("Transfer",
                Arrays.<TypeReference<?>>asList(
                        new TypeReference<Address>(true) {
                        },
                        new TypeReference<Address>(true) {
                        },

                        new TypeReference<Uint256>(false) {
                        }));

        filter.addSingleTopic(EventEncoder.encode(event));
        return web3j.ethLogObservable(filter).subscribe(onNext);
    }

    public void unsubscribeContract(Subscription subscription) {
        if (this.web3j == null) return;
        subscription.unsubscribe();
    }


    /**
     * 监听合约授权事件
     **/
    public Subscription subscribeApproval(String contractAddress, final Action1<? super Log> onNext) {
        if (this.web3j == null) return null;

        // 要监听的合约事件 交易
        EthFilter filter = new EthFilter(
                DefaultBlockParameter.valueOf(BigInteger.valueOf(0L)),
                DefaultBlockParameterName.LATEST,
                contractAddress);
        Event event = new Event("Approval",
                Arrays.<TypeReference<?>>asList(
                        new TypeReference<Address>(true) {//address indexed _owner
                        },
                        new TypeReference<Address>(true) {// address indexed _spender
                        },

                        new TypeReference<Uint256>(false) {//amount
                        }));

        filter.addSingleTopic(EventEncoder.encode(event));
        return web3j.ethLogObservable(filter).subscribe(onNext);
    }

    /**
     * 取消监听
     */
    public void unsubscribeApproval(Subscription subscription) {
        if (this.web3j == null) return;
        subscription.unsubscribe();
    }
}
