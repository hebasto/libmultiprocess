### CI quick-reference

All CI is just bash and nix.

* **Workflow**:
  -  `.github/workflows/ci.yml` – lists the jobs (`default`, `llvm`, …).
* **Scripts**:
  - `ci/scripts/run.sh` – spins up the Nix shell then calls…
  - `ci/scripts/ci.sh` – …to configure, build, and test.
* **Configuration**:
  - `ci/configs/*.sh` – defines flags for each job.
  - `shell.nix` – defines build environment (compilers, tools, libraries).

To run jobs locally:

```bash
CI_CONFIG=ci/configs/default.sh ci/scripts/run.sh
CI_CONFIG=ci/configs/llvm.sh    ci/scripts/run.sh
```
