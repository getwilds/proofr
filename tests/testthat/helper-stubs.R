response_status_running <- list(
  canJobStart = FALSE,
  jobStatus = "RUNNING",
  cromwellUrl = "https://some.url",
  jobInfo = list(
    WORKFLOWLOGDIR = "/some/path",
    SCRATCHDIR = "/some/path",
    SLURM_JOB_ID = "someid",
    CROMWELL_DIR = "/some/path",
    SERVERLOGDIR = "/some/path",
    SINGULARITY_CACHEDIR = "/some/path",
    SERVERTIME = "1-0",
    USE_AWS = FALSE,
    SLURM_JOB_ACCOUNT = "/some/path"
  )
)

response_status_not_running <- list(
  canJobStart = TRUE,
  jobStatus = NULL,
  cromwellUrl = NULL,
  jobInfo = list(
    WORKFLOWLOGDIR = NULL,
    SCRATCHDIR = NULL,
    SLURM_JOB_ID = NULL,
    CROMWELL_DIR = NULL,
    SERVERLOGDIR = NULL,
    SINGULARITY_CACHEDIR = NULL,
    SERVERTIME = NULL,
    USE_AWS = NULL,
    SLURM_JOB_ACCOUNT = NULL
  )
)

response_start_success <- list(
  job_id = "12345678",
  info = "Job submitted successfully. Some message"
)

response_start_conflict <- list(
  message = "Job is already running"
)

response_cancel_success <- list(
  message = "Proof/cromwell job for user xxxxx has been cancelled"
)

response_cancel_conflict <- list(
  message = "Job is not running, nothing to delete"
)

response_authenticate_success <- list(
  username = "jane",
  token = "somerandomstring",
  server_url = NULL,
  proxy_url = NULL,
  job_id = NULL,
  token_creation_date = NULL
)

response_info_success <- list(
  branch = "main",
  commit_sha = "c4b85200632c2f9bd5e8173179208c3b32c7db7a",
  short_commit_sha = "c4b85200",
  commit_message = "two-eye lamb, as a so",
  tag = "v.0.1.0"
)
