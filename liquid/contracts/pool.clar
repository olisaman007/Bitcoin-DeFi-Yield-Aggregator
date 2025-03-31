(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_INSUFFICIENT_FUNDS (err u101))
(define-constant ERR_INVALID_AMOUNT (err u102))

(define-map liquidity-providers principal uint)
(define-data-var total-liquidity uint u0)
(define-data-var fee-rate uint u5) ;; 0.5% fee
(define-data-var owner principal tx-sender)

(define-public (set-fee-rate (new-rate uint))
  (begin
    (asserts! (is-eq tx-sender (var-get owner)) ERR_UNAUTHORIZED)
    (var-set fee-rate new-rate)
    (ok new-rate)))

(define-public (deposit (amount uint))
  (begin
    (asserts! (> amount u0) ERR_INVALID_AMOUNT)
    (let ((sender tx-sender)
          (current-balance (default-to u0 (map-get? liquidity-providers sender))))
      (map-set liquidity-providers sender (+ current-balance amount))
      (var-set total-liquidity (+ (var-get total-liquidity) amount))
      (ok amount))))

(define-public (withdraw (amount uint))
  (begin
    (asserts! (> amount u0) ERR_INVALID_AMOUNT)
    (let ((sender tx-sender)
          (current-balance (default-to u0 (map-get? liquidity-providers sender))))
      (asserts! (>= current-balance amount) ERR_INSUFFICIENT_FUNDS)
      (map-set liquidity-providers sender (- current-balance amount))
      (var-set total-liquidity (- (var-get total-liquidity) amount))
      (ok amount))))

(define-read-only (get-liquidity (account principal))
  (default-to u0 (map-get? liquidity-providers account)))

(define-read-only (get-total-liquidity)
  (var-get total-liquidity))

(define-read-only (get-fee-rate)
  (var-get fee-rate))

(define-public (transfer-ownership (new-owner principal))
  (begin
    (asserts! (is-eq tx-sender (var-get owner)) ERR_UNAUTHORIZED)
    (var-set owner new-owner)
    (ok new-owner)))
