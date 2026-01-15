# \# Golden AMI Orchestrator (Skeleton Framework)

# 

# \## Overview

# 

# This repository contains the \*\*Golden AMI Orchestrator skeleton\*\* for the

# Equifax AWACS / Vine migration program.

# 

# The purpose of this implementation is to provide a \*\*stable, extensible,

# and pipeline-agnostic orchestration framework\*\* for building Golden AMIs

# across multiple flavors, while intentionally deferring environment- and

# vendor-specific behavior until validated inputs are provided.

# 

# This repository implements \*\*structure and contracts only\*\* — not final AMI logic.

# 

# ---

# 

# \## Design Principles

# 

# \- Parameter-driven execution

# \- No AWS-, Equifax-, or vendor-specific assumptions

# \- No hardcoded secrets, endpoints, or agent behavior

# \- Idempotent where feasible

# \- Explicit failure on unrecoverable errors

# \- Additive future changes (no rewrites)

# 

# ---

# 

# \## What Is Implemented

# 

# \### ✔ Orchestration Entry Point

# \- `Invoke-AMIBuild.ps1` with required and optional parameters

# \- Global error handling with structured logging

# \- Deterministic execution flow

# 

# \### ✔ Execution Flow Skeleton

# The orchestrator executes the following steps in order (placeholders):

# 

# 1\. InitializeBuildEnvironment  

# 2\. PreBuildChecks  

# 3\. BaselineConfiguration  

# 4\. FlavorModules  

# 5\. RebootCoordination  

# 6\. ValidationGate  

# 7\. Cleanup  

# 8\. SealPhase  

# 

# Each step emits structured logs and writes execution checkpoints.

# 

# ---

# 

# \### ✔ Contract Test Mode

# 

# When executed with `-TestContract`, the orchestrator:

# 

# \- Validates parameter parsing

# \- Loads all modules

# \- Parses schemas and feature flags

# \- Emits structured logs

# \- Emits a build manifest

# \- Performs \*\*no installs, reboots, or destructive actions\*\*

# 

# This mode is designed for CI validation and architecture review.

# 

# ---

# 

# \### ✔ Resume Semantics (Skeleton)

# 

# \- Execution checkpoints are written to `State/state.json`

# \- Resume logic is implemented via `-ResumeFromCheckpoint`

# \- The exact reboot/resume mechanism is intentionally deferred

# &nbsp; pending AWS ProServe confirmation

# 

# This satisfies the current skeleton requirements without

# premature pipeline coupling.

# 

# ---

# 

# \### ✔ SentinelOne Handling Hooks

# 

# The following placeholder hooks exist with \*\*no assumptions\*\*:

# 

# \- DetectBuildSuppressionSignal

# \- SuppressSecurityAgent

# \- RestoreSecurityAgent

# 

# Actual behavior will be implemented only after Equifax

# provides validated run-tag definitions.

# 

# ---

# 

# \### ✔ Build Manifest

# 

# Each run emits a `build-manifest.json` containing:

# 

# \- Execution mode (NormalBuild / ContractTest)

# \- Flavor, environment, and phase metadata

# \- Timestamps and duration

# \- Validation summary

# \- Reboot and security suppression status

# 

# This manifest serves as the authoritative execution receipt.

# 

# ---

# 

# \## GitHub Actions Usage

# 

# This repository uses \*\*GitHub Actions\*\* for \*\*contract validation only\*\*.

# 

# \### What GitHub Actions Does

# \- Runs `-TestContract`

# \- Verifies module loading and logging

# \- Uploads the build manifest as an artifact

# 

# \### What GitHub Actions Does NOT Do

# \- Perform AMI builds

# \- Handle Windows reboots

# \- Resume execution after reboot

# 

# This is intentional. GitHub-hosted runners cannot survive reboots.

# The final execution environment (including reboot support and

# self-hosted runners) will be finalized once AWS ProServe confirms

# pipeline requirements.

# 

# ---

# 

# \## Future Work (Explicitly Deferred)

# 

# The following items are intentionally out of scope until inputs are confirmed:

# 

# \- Final reboot/resume mechanism

# \- Self-hosted runner requirements

# \- Flavor-specific module logic

# \- Validation rule enforcement

# \- SentinelOne suppression logic

# \- AWS pipeline integration details

# 

# ---

# 

# \## Status

# 

* # Skeleton framework complete  
* # Architecture-review ready  
* # Pipeline-agnostic  
* # Safe to extend once requirements land  

# 

# No further work is required at this phase.



