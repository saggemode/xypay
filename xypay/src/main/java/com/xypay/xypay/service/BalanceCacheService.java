package com.xypay.xypay.service;

import com.xypay.xypay.domain.Balance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class BalanceCacheService {
    
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    
    private static final String BALANCE_CACHE_PREFIX = "balance:";
    private static final int CACHE_TTL_MINUTES = 5;
    
    public void cacheBalance(Balance balance) {
        String key = BALANCE_CACHE_PREFIX + balance.getAccountId();
        redisTemplate.opsForValue().set(key, balance, CACHE_TTL_MINUTES, TimeUnit.MINUTES);
    }
    
    public Balance getCachedBalance(String accountId) {
        String key = BALANCE_CACHE_PREFIX + accountId;
        return (Balance) redisTemplate.opsForValue().get(key);
    }
    
    public void evictBalance(String accountId) {
        String key = BALANCE_CACHE_PREFIX + accountId;
        redisTemplate.delete(key);
    }
}