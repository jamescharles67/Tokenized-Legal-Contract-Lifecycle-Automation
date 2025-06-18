;; Legal Firm Verification Contract
;; Manages verification and registration of legal service firms

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_VERIFIED (err u102))
(define-constant ERR_INVALID_FIRM (err u103))

;; Data structures
(define-map verified-firms principal {
  name: (string-ascii 100),
  license-number: (string-ascii 50),
  verification-date: uint,
  is-active: bool
})

(define-map firm-ratings principal uint)

;; Public functions
(define-public (register-firm (firm-principal principal) (name (string-ascii 100)) (license-number (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? verified-firms firm-principal)) ERR_ALREADY_VERIFIED)
    (map-set verified-firms firm-principal {
      name: name,
      license-number: license-number,
      verification-date: block-height,
      is-active: true
    })
    (ok true)
  )
)

(define-public (deactivate-firm (firm-principal principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? verified-firms firm-principal)
      firm-data (begin
        (map-set verified-firms firm-principal (merge firm-data { is-active: false }))
        (ok true)
      )
      ERR_NOT_VERIFIED
    )
  )
)

(define-public (rate-firm (firm-principal principal) (rating uint))
  (begin
    (asserts! (is-verified-firm firm-principal) ERR_NOT_VERIFIED)
    (asserts! (and (>= rating u1) (<= rating u5)) ERR_INVALID_FIRM)
    (map-set firm-ratings firm-principal rating)
    (ok true)
  )
)

;; Read-only functions
(define-read-only (is-verified-firm (firm-principal principal))
  (match (map-get? verified-firms firm-principal)
    firm-data (get is-active firm-data)
    false
  )
)

(define-read-only (get-firm-info (firm-principal principal))
  (map-get? verified-firms firm-principal)
)

(define-read-only (get-firm-rating (firm-principal principal))
  (default-to u0 (map-get? firm-ratings firm-principal))
)
