package com.ruoyi.blockchain.runner;

import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.conf.EthConfig;
import com.ruoyi.blockchain.domain.ChainEthWallet;
import com.ruoyi.blockchain.domain.EthTrade;
import com.ruoyi.blockchain.service.IChainEthWalletService;
import com.ruoyi.blockchain.service.IEthTradeService;
import com.ruoyi.blockchain.service.IMchChainWalletInfoService;
import com.ruoyi.blockchain.service.InnerBlockchainServer;
import com.ruoyi.blockchain.wallet.EthTransferMonitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.methods.response.Transaction;
import org.web3j.protocol.http.HttpService;
import rx.functions.Action1;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;

@Component
public class EthRunner implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(EthRunner.class);

    @Resource
    EthConfig ethConfig;

    @Resource
    private IChainEthWalletService chainEthWalletService;

    @Resource
    IEthTradeService ethTradeService;

    @Override
    public void run(String... args) throws Exception {
        if (!ethConfig.isMonitorSwitch()) {
            logger.info("未开启监听开关");
            return;
        }
        logger.info("EthRunner start -------------------------------");

        EthTransferMonitor monitor = EthTransferMonitor.getInstance();
        Web3j web3j = Web3j.build(new HttpService(ethConfig.getJsonRpcUrl()));
        monitor.setWeb3j(web3j);
        monitor.subscribeHasTrans(new Action1<Transaction>() {
            @Override
            public void call(Transaction transaction) {
                try {
                    if (transaction.getValue().compareTo(new BigInteger("0")) <= 0) {
                        logger.info("value 小于等于 0 不处理 {}", transaction.getHash());
                        return;
                    }
                    logger.info("开始处理 - hash:{}  value:{}", transaction.getHash(), transaction.getValue());
                    ChainEthWallet wallet = chainEthWalletService.selectChainEthWalletByAddress(transaction.getTo());
                    if (wallet == null) {
                        return;
                    }
                    EthTrade ethTrade = new EthTrade();
                    ethTrade.setTxHash(transaction.getHash());
                    ethTrade.setAmount(new BigDecimal(transaction.getValue()).divide(new BigDecimal("1000000000000000000"), 18, RoundingMode.HALF_UP));
                    ethTrade.setBlockNum(transaction.getBlockNumber().longValue());
                    ethTrade.setFromAddress(transaction.getFrom());
                    ethTrade.setToAddress(transaction.getTo());
                    ethTrade.setTxTime(System.currentTimeMillis());

                    ethTradeService.insertEthTrade(ethTrade);
                } catch (Exception e) {
                    logger.error("处理地失败 {}", e.getMessage(), e);
                }

                //mchChainWalletInfoService.selectMchChainWalletInfoByAddress(transaction.getTo(), ChainType.ETH.toString().toUpperCase());
            }
        });
    }
}
