# proofr v0.2

* Change token handling to support a Shiny workflow where we can't store secrets as env vars. All functions now accept a token, but you can also just set an env var with the token. `proof_authenticate` no longer sets an env var with the token (#11)

# proofr v0.1

* Document server up time of 7 days (#10)
* Set curl timeout so users don't have to wait so long for timeout failure (#8)
* Surface error messages from PROOF API if useful to users (#7)
* Change `proof_start` to use `slurm_account` as body param instead of `pi_name` (#6)
* Write more tests covering major points of the exported fxns (#5)
* export `proof_header` (#4)
* rcromwell <--> proofr integration (#2)
* PROOF API token caching (#1)
