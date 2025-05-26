package com.eduapp.backend.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class AccountCleanupScheduler {

    private final UserRepository userRepository;

    public AccountCleanupScheduler(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Scheduled(cron = "0 0 2 * * *") // Every day at 2:00 AM
    @Transactional
    public void deleteScheduledAccounts() {
        List<User> toDelete = userRepository
            .findAllByDeletionRequestedTrueAndScheduledDeletionAtBefore(LocalDateTime.now());

        if (!toDelete.isEmpty()) {
            userRepository.deleteAll(toDelete);
            System.out.println("✅ Deleted " + toDelete.size() + " scheduled user accounts.");
        }
    }
}
